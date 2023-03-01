class Doctor::PagesController < ApplicationController
  before_action :logged_in_doctor

  def dashboard
    start_date = params.fetch(:start_date, Date.today).to_date
    @appointments = DoctorAppointment.all.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  private
    def logged_in_doctor
      unless doctor_logged_in?
        flash[:alert] = "Please login first"
        redirect_to doctor_login_path
      end
    end
end
