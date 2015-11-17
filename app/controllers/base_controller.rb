class BaseController < ApplicationController
  include ExamsHelper
  include Filterable

  before_action :authenticate_user!
end
