class Admin::TasksController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @task.save
      redirect_to admin_edit_task_path(@task)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to admin_edit_task_path(@task)
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
    params.require(:task).permit(:number, :level, :skill, subtasks_attributes: [:id, :name, :max_points, :_destroy])
  end
end
