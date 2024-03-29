class Nurse::PagesController < ApplicationController
  before_action :logged_in_nurse

  def dashboard
    @appointments = Appointment.where(status: "pending")

    start_date = params.fetch(:start_date, Date.today).to_date
    @doctor_appointments = DoctorAppointment.all.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def main_appointment
    appointment = Appointment.find(params["appointment"])

    appointment.status = "confirmed"
    appointment.save

    doctor_appointment = DoctorAppointment.new

    doctor_appointment.appointment_id = appointment.id
    doctor_appointment.user_id = appointment.user_id
    doctor_appointment.start_time = appointment.start_time
    doctor_appointment.save

    UserMailer.accepted_appointment(User.find(appointment.user_id), appointment).deliver

    flash[:notice] = "Succefully Assigned Schedule..."
    redirect_to nurse_success_path
  end

  def secondary_apppointment
    appointment = Appointment.find(params["appointment"])

    appointment.status = "confirmed"
    appointment.save

    doctor_appointment = DoctorAppointment.new

    doctor_appointment.appointment_id = appointment.id
    doctor_appointment.user_id = appointment.user_id
    doctor_appointment.start_time = appointment.pm_start_time
    doctor_appointment.save

    UserMailer.accepted_appointment_secondary(User.find(appointment.user_id), appointment).deliver

    flash[:notice] = "Succefully Assigned Schedule..."
    redirect_to nurse_success_path
  end

  def decline
    appointment = Appointment.find(params["appointment"])
    appointment.status = "decline"
    appointment.save

    UserMailer.decline_appointment(User.find(appointment.user_id), appointment).deliver

    flash[:notice] = "Succefully Declined Schedule..."
    redirect_to nurse_success_decline_path
  end

  def success_decline
  end

  def success
  end

  private
    def logged_in_nurse
      unless nurse_logged_in?
        flash[:alert] = "Please login first"
        redirect_to nurse_login_path
      end
    end
end
