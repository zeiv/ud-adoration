class TimeSlot < ActiveRecord::Base
  belongs_to :person
  scope :on_day, -> (day) {where day: day}

  def queue_reminder
    if last_sent_at.nil? || last_sent_at < 20.minutes.ago
      Resque.enqueue(TimeSlotReminder, person.id, id)
      self.last_sent_at = Time.zone.now
      self.save
    end
  end

  # Gets TimeSlots for times on a certain day.
  # Accepts day as string and datetimes in an array.
  def for_times_on_day(day = '', times = [])

  end

  def frequency
    # one week in seconds
    604800
  end

  def at
    # at_array = []
    # person.reminders.each do |reminder|
    #   at_array << "#{day} #{(time - reminder.hours_before.hours).strftime('%H:%M')}"
    # end
    # return at_array
    "#{day} #{(time - person.reminders.first.hours_before.hours).strftime('%H:%M')}"
  end
end
