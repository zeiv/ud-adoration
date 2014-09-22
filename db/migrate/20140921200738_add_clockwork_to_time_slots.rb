class AddClockworkToTimeSlots < ActiveRecord::Migration
  def change
    add_column :time_slots, :day, :string
    change_column :time_slots, :time, :string
  end
end
