class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:about, :export]
  before_action :check_user_information, only: :dashboard
  before_action :check_emergency_contact, only: :dashboard
  def dashboard
    #UserMailer.welcome_email(current_user).deliver
    start_date = params.fetch(:start_date, Date.today).to_date
    @appointments = current_user.appointments.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def about
  end

  def appointments
    @consultations = Consultation.where(user_id: current_user.id)
  end

  def export
    @consultation = Consultation.find(params[:consultation])
    @doctor_appointment = DoctorAppointment.find(@consultation.doctor_appointment_id)
    @user_appointment = Appointment.find(@doctor_appointment.appointment_id)
    
    @user = current_user || User.find(@consultation.user_id)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "report", template: "pages/export", formats: :html, disposition: :inline, layout: 'pdf'
      end
    end
  end

  private
    def check_user_information
      unless current_user.firstname && current_user.firstname.present?
        redirect_to users_information_path
      end
    end

    def check_emergency_contact
      unless current_user.ec_firstname && current_user.ec_firstname.present?
        redirect_to users_emergency_contact_path
      end
    end
end
