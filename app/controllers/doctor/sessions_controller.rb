class Doctor::SessionsController < ApplicationController
  def new
  end

  def create
    doctor = Doctor.find_by(email: params[:session][:email])
    if doctor && doctor.authenticate(params[:session][:password])
      log_in_doctor(doctor)
      flash[:notice] = "Successfully Logged in"
      redirect_to doctor_dashboard_path
    else
      flash[:alert] = "Invalid Credentials"
      redirect_to doctor_login_path
    end
  end

  def destroy
    log_out_doctor
    flash[:notice] = "Successfully logged out"
    redirect_to doctor_login_path
  end
end
