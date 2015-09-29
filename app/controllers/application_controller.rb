class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
  end

  def after_sign_out_path_for(resource)
    new_user_session_url
  end

  def after_sign_in_path_for(user)
    stored_location_for(user) ||
      if user.has_role? :admin
        root_url
      elsif user.has_role? :teacher
        root_url
      else
        root_url
      end
  end
end
