class Reports::GroupsController < Reports::BaseController
  load_and_authorize_resource through: :current_exam

  def index
  end

  def show
  end
end
