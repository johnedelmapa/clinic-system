class Doctor::ConsultationsController < ApplicationController
  def new
    @doctor_appointment = DoctorAppointment.find(params[:appointment])
    @user_appointment = Appointment.find(@doctor_appointment.appointment_id)
    @user = User.find(@doctor_appointment.user_id)
    @consultation = Consultation.new
  end

  def create
    consultation = Consultation.new
    consultation.user_id = params[:consultation][:user_id]
    consultation.doctor_appointment_id = params[:consultation][:doctor_appointment_id]
    consultation.assessment = params[:consultation][:assessment]
    consultation.diagnosis = params[:consultation][:diagnosis]
    consultation.plan = params[:consultation][:plan]
    consultation.save

    flash[:notice] = "Successfully submitted reports"
    doctor_appointment = DoctorAppointment.find(params[:consultation][:doctor_appointment_id])
    appointment = Appointment.find(doctor_appointment.appointment_id)
    appointment.status = "completed"
    appointment.save
    redirect_to doctor_dashboard_path
  end

end
