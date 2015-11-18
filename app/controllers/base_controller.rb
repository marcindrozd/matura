class BaseController < ApplicationController
  include ExamsHelper
  include Filterable

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    sign_out
    redirect_to new_user_session_url, alert: t('not_authorized')
  end
end
