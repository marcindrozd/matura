class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :last_name, :first_name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_out_path_for(resource)
    new_user_session_url
  end

  def after_sign_in_path_for(user)
    stored_location_for(user) ||
      if user.has_role? :admin
        root_url
      elsif user.has_role? :teacher
        exam_groups_url
      else
        root_url
      end
  end
end
