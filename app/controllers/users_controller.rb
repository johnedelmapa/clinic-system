class UsersController < ApplicationController
  before_action :authenticate_user!
  def information
    @user = current_user
    if !request.get?
      if @user.update(user_params)
        redirect_to users_emergency_contact_path, notice: "Saved..."
      end
    end
  end

  def emergency_contact
    @user = current_user
    if !request.get?
      if @user.update(user_params)
        redirect_to users_history_path, notice: "Saved..."
      end
    end
  end

  def history
    @user = current_user
    if !request.get?
      if @user.update(user_params)
        redirect_to root_path, notice: "Saved..."
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :dob, :gender, :department, :phone, :street, :city, :province, :zipcode, :ec_firstname, :ec_lastname, :ec_mobile, :ec_relationship,
      :height, :weight, :bmi, :bmi_interpretation, :blood_type, :hand_type, :food_allergies, :drug_allergies, :smoke, :stick_count, :smoke_duration, :alcohol, 
    :alcohol_count, :drug_history, :herbal_meds, :blood_transfusion, :artificial_body, :dentures, :corrective)
    end
   
end
