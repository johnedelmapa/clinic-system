class Doctor::UsersController < ApplicationController

  def information
    @user = User.find(params[:user])
  end

  def emergency_contact
    @user = User.find(params[:user])
  end

  def history
    @user = User.find(params[:user])
  end
end
