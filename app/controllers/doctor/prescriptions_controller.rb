class Doctor::PrescriptionsController < ApplicationController
  def create
    prescription = Prescription.new
    prescription.user_id = params[:prescription][:user_id]
    prescription.doctor_appointment_id = params[:prescription][:doctor_appointment_id]
    prescription.name = params[:prescription][:name]
    prescription.frequency = params[:prescription][:frequency]
    prescription.quantity = params[:prescription][:quantity]
    prescription.save
    flash[:notice] = "Successfully added prescription"

    redirect_back(fallback_location: request.referer)
  end
end
  