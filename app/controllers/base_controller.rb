class BaseController < ApplicationController
  include ExamsHelper

  before_action :authenticate_user!
end
