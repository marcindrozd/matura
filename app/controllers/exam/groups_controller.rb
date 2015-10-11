class Exam::GroupsController < Exam::BaseController
  load_and_authorize_resource through: :current_exam

  def index
  end

  def edit
  end

  def update
  end

  def show
    @tasks = @group.tasks
  end
end
