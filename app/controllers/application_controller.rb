class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:student_id])
    end
end
