class AddLastSentAtToTimeSlots < ActiveRecord::Migration
  def change
    add_column :time_slots, :last_sent_at, :datetime
  end
end
