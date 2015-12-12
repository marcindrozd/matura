class Exam::TasksController < Exam::BaseController
  load_and_authorize_resource :student, through: :current_exam
  load_and_authorize_resource through: :student

  def edit
    @scores = @task.scores.where(student: @student).ordered
  end

  def update
    @scores = Score.update(params[:scores].keys, params[:scores].values)
    @scores.reject! { |s| s.errors.empty? }

    if @scores.empty?
      next_task = @student.tasks.where(level: @task.level).where('tasks.number > ?', @task.number).first || @student.tasks.where(level: @task.level).where('tasks.number >= ? AND tasks.secondary_number > ?', @task.number, @task.secondary_number).first
      
      if next_task
        redirect_to edit_exam_student_task_url(@student, next_task)
      else
        redirect_to edit_exam_group_url(@student.group), notice: t('.score_updated')
      end
    else
      render :edit
    end
  end
end
