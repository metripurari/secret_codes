class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation, :code])
    end

  private
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end
end
