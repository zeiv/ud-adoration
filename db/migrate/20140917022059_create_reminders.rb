class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.integer :hours_before

      t.timestamps
    end
 
    create_table :reminders_time_slots, id: false do |t|
      t.belongs_to :reminder
      t.belongs_to :time_slot
    end
  end
end
