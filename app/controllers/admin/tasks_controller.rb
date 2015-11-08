class Admin::TasksController < Admin::BaseController
  load_and_authorize_resource through: :current_exam

  def index
  end

  def new
  end

  def create
    success, @task = task_service.create

    if success
      redirect_to edit_admin_task_path(@task)
    else
      render :new
    end
  end

  def edit
  end

  def update
    success, @task = task_service.update task_params

    if success
      redirect_to edit_admin_task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to admin_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:number, :level, :skill, subtasks_attributes: [:id, :number, :max_points, :_destroy])
  end

  def task_service
    @task_service ||= TaskService.new @task
  end
end
