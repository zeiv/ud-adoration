class Notifications < ActionMailer::Base
  default from: Figaro.env.gmail_username

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.reminder.subject
  #
  def reminder(person, time_slots)
    @person = person
    @time_slot_text = "#{time_slots.first.day} #{time_slots.first.time.strftime('%l:%M%P')} - #{(time_slots.last.time + 30.minutes).strftime('%l:%M%P')}"

    mail to: @person.email, subject: 'Adoration Reminder'
  end

  def custom(emails, subject, message)
    @message = message

    mail to: emails, subject: subject
  end
end
