class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.datetime :time
      t.integer :person_id

      t.timestamps
    end
  end
end
