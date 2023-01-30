# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def create
    @user = Student.find_by(student_id: params[:user][:student_id])
    if @user && @user.present?
      super
    else
      redirect_to new_user_registration_path, alert: "Student ID Does not exist"
    end
  end
end
  