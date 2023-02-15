class Doctor::PagesController < ApplicationController
  before_action :logged_in_doctor

  def dashboard
  end

  private
    def logged_in_doctor
      unless doctor_logged_in?
        flash[:alert] = "Please login first"
        redirect_to doctor_login_path
      end
    end
end
