class Notifications < ActionMailer::Base
  default from: Figaro.env.gmail_username

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.reminder.subject
  #
  def reminder(person, time_slot)
    @person = person
    @time_slot = time_slot

    mail to: @person.email, subject: 'Adoration Reminder'
  end

  def custom(emails, subject, message)
    @message = message

    mail to: emails, subject: subject
  end
end
