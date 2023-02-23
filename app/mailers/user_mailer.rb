class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def confirmation_message(user, appointment)
    @user = user
    @appointment = appointment
    mail(to: user.email, subject: 'Successful booking')
  end

  def accepted_appointment(user, appointment)
    @user = user
    @appointment = appointment
    mail(to: user.email, subject: 'Accepted booking')
  end

  def accepted_appointment_secondary(user, appointment)
    @user = user
    @appointment = appointment
    mail(to: user.email, subject: 'Accepted booking')
  end
end
