# Preview all emails at http://localhost:3000/rails/mailers/notifications
class NotificationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications/reminder
  def reminder
    Notifications.reminder(Person.first, Person.first.time_slots.first)
  end

end
