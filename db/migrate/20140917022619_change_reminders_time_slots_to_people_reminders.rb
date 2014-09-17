class ChangeRemindersTimeSlotsToPeopleReminders < ActiveRecord::Migration
  def up 
    drop_table :reminders_time_slots
 
    create_table :people_reminders, id: false do |t|
      t.belongs_to :person
      t.belongs_to :reminder
    end
  end

  def down 
    drop_table :people_reminders
 
    create_table :reminders_time_slots, id: false do |t|
      t.belongs_to :reminder
      t.belongs_to :time_slot
    end
  end
end
