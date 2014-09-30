module Caseadilla
  class HomeController < Caseadilla::CaseadillaController
    def index
      weekdays = Date::DAYNAMES[1..-2].dup
      times = (DateTime.parse('8:00am CST').to_i..DateTime.parse('11:30am CST').to_i).step(15.minutes).map{|t| Time.at(t).localtime(Time.zone.utc_offset).to_datetime}
      times << nil
      times << (DateTime.parse('12:45pm CST').to_i..DateTime.parse('4:30pm CST').to_i).step(15.minutes).map{|t| Time.at(t).localtime(Time.zone.utc_offset).to_datetime}
      # This line makes sure the times still line up across the days
      times << [nil]*4
      times << (DateTime.parse('5:45pm CST').to_i..DateTime.parse('7:30pm CST').to_i).step(15.minutes).map{|t| Time.at(t).localtime(Time.zone.utc_offset).to_datetime}
      times_for_friday = (DateTime.parse('8:00am CST').to_i..DateTime.parse('11:30am CST').to_i).step(15.minutes).map{|t| Time.at(t).localtime(Time.zone.utc_offset).to_datetime}
      times_for_friday << nil
      times_for_friday << (DateTime.parse('12:45pm CST').to_i..DateTime.parse('4:30pm CST').to_i).step(15.minutes).map{|t| Time.at(t).localtime(Time.zone.utc_offset).to_datetime}
      times_for_friday << (DateTime.parse('4:45pm CST').to_i..DateTime.parse('7:30pm CST').to_i).step(15.minutes).map{|t| Time.at(t).localtime(Time.zone.utc_offset).to_datetime}
      times.flatten!
      times_for_friday.flatten!
      possible_time_slots_in_progress = Hash[weekdays.collect { |d| [d, times] }]
      possible_time_slots_in_progress['Friday'] = times_for_friday
      @possible_time_slots = possible_time_slots_in_progress
      @filled_time_slots = Hash[weekdays.collect { |d| [d, TimeSlot.on_day(d).references(:person)] }]
    end

    def email
      @email_group_options = Date::DAYNAMES[1..-2].dup
    end

    def send_email
      subject = params['subject']
      message = params['message'].first
      people = Person.joins(:time_slots).where(time_slots: {day: params['groups']}).pluck(:email)
      if Notifications.custom(people, subject, message).deliver
        flash[:notice] = 'Email has been sent'
        redirect_to caseadilla_root_path
      end
    end
  end
end