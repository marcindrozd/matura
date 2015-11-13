class Exam::TasksController < Exam::BaseController
  load_and_authorize_resource :student, through: :current_exam
  load_and_authorize_resource through: :student

  def edit
    @scores = @task.scores.where(student: @student)
  end

  def update
    if @task.update task_params
      redirect_to edit_exam_group_url(@student.group), notice: t('.score_updated')
    else
      render :edit
    end
  end

  private

  def task_params
    params.require(:task).permit(scores_attributes: [:id, :score, :_destroy])
  end
end
