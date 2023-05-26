class Nurse::UsersController < ApplicationController

  def information
    @user = User.find(params[:user])
    @history = Consultation.where(user_id: @user.id)
  end

  def emergency_contact
    @user = User.find(params[:user])
  end

  def history
    @user = User.find(params[:user])
  end
end
