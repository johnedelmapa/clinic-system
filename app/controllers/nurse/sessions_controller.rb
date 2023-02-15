class Nurse::SessionsController < ApplicationController
  def new
  end

  def create
    nurse = Nurse.find_by(email: params[:session][:email])
    if nurse && nurse.authenticate(params[:session][:password])
      log_in_nurse(nurse)
      flash[:notice] = "Successfully Logged in"
      redirect_to nurse_dashboard_path
    else
      flash[:alert] = "Invalid Credentials"
      redirect_to nurse_login_path
    end
  end

  def destroy
    log_out_nurse
    flash[:notice] = "Successfully logged out"
    redirect_to nurse_login_path
  end
end
