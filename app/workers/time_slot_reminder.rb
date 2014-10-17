class TimeSlotReminder
  @queue = :emails

  def self.perform(person_id, time_slot_id)
    person = Person.find person_id
    time_slot = person.time_slots.find time_slot_id
    if ConfigVar.find_by(name: :system_enabled).boolean_value == true
      time_slot.class.transaction do
        time_slots = get_consecutive_time_slots(person, time_slot)
        set_sent_at!(time_slots)
        Notifications.reminder(person, time_slots).deliver
      end
    else
      puts "System disabled: email not sent.\n#{TimeSlot.find(time_slot_id).inspect}"
    end
  end

  def self.get_consecutive_time_slots(p, ts)
    time_slots_for_day = p.time_slots.on_day(ts.day).by_time
    results = [ts]
    time_slots_for_day.each do |t|
      if (results.last.time + 15.minutes).strftime('%H:%M%P') == t.time.strftime('%H:%M%P')
        results << t
      end
    end
    results
  end

  def self.set_sent_at!(time_slots)
    time_slots.each do |t|
      t.last_sent_at = Time.now
      t.save
    end
  end
end