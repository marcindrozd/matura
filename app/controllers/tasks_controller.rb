class TasksController < ApplicationController

  def index
    @exam = Exam.find(params[:exam_id])
    @tasks = @exam.tasks
    @tasks_standard = @exam.tasks.standard
    @tasks_extended = @exam.tasks.extended
    @tasks_bilingual = @exam.tasks.bilingual
    @subtasks = @tasks.collect { |task| task.subtasks }
  end

  def new
    @exam = Exam.find(params[:exam_id])
    @task = @exam.tasks.new
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
