class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def confirmation_message(user, appointment)
    @user = user
    @appointment = appointment
    mail(to: user.email, subject: 'Appointment Sucessfully Created')
  end
end
