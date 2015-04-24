class TasksController < ApplicationController

  def index
    @tasks_standard = Task.where(task_type: "standardowe")
    @tasks_extended = Task.where(task_type: "rozszerzone")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = "Task has been created!"
      redirect_to tasks_path
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:task_number, :task_subnumber, :max_points, :task_type)
  end
end