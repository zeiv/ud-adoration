class AddMessageToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :message, :text
  end
end
