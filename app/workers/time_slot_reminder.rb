class TimeSlotReminder
  @queue = :default

  def self.perform(person_id, time_slot_id)
    person = Person.find person_id
    time_slot = person.time_slots.find time_slot_id
    Notifications.reminder(person, time_slot).deliver
  end
end