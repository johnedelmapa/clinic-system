class Nurse::PagesController < ApplicationController
  before_action :logged_in_nurse

  def dashboard
  end

  private
    def logged_in_nurse
      unless nurse_logged_in?
        flash[:alert] = "Please login first"
        redirect_to nurse_login_path
      end
    end
end
