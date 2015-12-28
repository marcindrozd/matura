class Admin::TasksController < Admin::BaseController
  load_and_authorize_resource through: :current_exam

  def index
    @tasks = apply_filters(@tasks, default_sorts: 'number asc')
  end

  def new
  end

  def create
    success, @task = task_service.create

    if success
      redirect_to edit_admin_task_path(@task), notice: t('.task_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    success, @task = task_service.update task_params

    if success
      redirect_to edit_admin_task_path(@task), notice: t('.task_updated')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to admin_tasks_path, notice: t('.task_destroyed')
  end

  private

  def task_params
    params.require(:task).permit(:number, :level, :skill, :secondary_number, :description, subtasks_attributes: [:id, :number, :max_points, :_destroy])
  end

  def task_service
    @task_service ||= TaskService.new @task
  end
end
