class PagesController < ApplicationController
  before_action :check_user_information, only: :dashboard
  before_action :check_emergency_contact, only: :dashboard
  def dashboard
  end

  def about
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
