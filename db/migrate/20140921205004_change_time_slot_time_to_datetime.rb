class ChangeTimeSlotTimeToDatetime < ActiveRecord::Migration
  def change
    change_column :time_slots, :time, 'timestamp USING CAST(time AS timestamp)'
  end
end
