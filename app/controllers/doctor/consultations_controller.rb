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
    consultation.medical_prescriptions = params[:consultation][:medical_prescriptions]
    consultation.save

    flash[:notice] = "Successfully submitted reports"
    doctor_appointment = DoctorAppointment.find(params[:consultation][:doctor_appointment_id])
    appointment = Appointment.find(doctor_appointment.appointment_id)
    appointment.status = "completed"
    appointment.save


    find_user = User.find(params[:consultation][:user_id])
    find_consultation = Consultation.find_by(user_id: params[:consultation][:user_id], doctor_appointment_id: params[:consultation][:doctor_appointment_id], assessment: params[:consultation][:assessment])
    UserMailer.send_report(find_user, find_consultation).deliver

    redirect_to doctor_dashboard_path
  end

  def cancel
    @doctor_appointment = DoctorAppointment.find(params[:doctor_appointment])
    find_user = User.find(@doctor_appointment.user_id)
    UserMailer.cancel_appointment(find_user, @doctor_appointment).deliver
    @doctor_appointment.destroy
    flash[:notice] = "Successfully cancelled appointment"
    redirect_to doctor_dashboard_path
  end

end
