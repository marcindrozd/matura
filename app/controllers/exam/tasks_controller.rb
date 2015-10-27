class Exam::TasksController < Exam::BaseController
  load_and_authorize_resource :student, through: :current_exam
  load_and_authorize_resource through: :student

  def edit
    @scores = @task.scores.where(student: @student)
  end
end
