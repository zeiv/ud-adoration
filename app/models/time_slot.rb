class TimeSlot < ActiveRecord::Base
  belongs_to :person
  after_create :schedule_reminders
  before_destroy :delete_reminders

  def schedule_reminders
    person.reminders.each do |reminder|
      Resque.enqueue_at((self.time - reminder.hours_before.hours), TimeSlotReminder, person.id, id)
    end
  end

  def delete_reminders
    person.reminders.each do |reminder|
      Resque.remove_delayed(TimeSlotReminder, person.id, id)
    end
  end
end
