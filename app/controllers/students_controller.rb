class StudentsController < ApplicationController
  def index
    @exam = Exam.find(params[:exam_id])
    @group = Group.find(params[:group_id])
    @students = @group.students
    @student = Student.new
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @group = Group.find(params[:group_id])
    @student = @group.students.create(name: generate_name)

    if @student.save
      redirect_to exam_group_students_path(@exam, @group), notice: 'Dodano ucznia'
      StudentScoresHandler.new(@exam, @student).add_all_tasks_to_student
    else
      render 'groups/show'
    end
  end

  def edit
    @exam = Exam.find(params[:exam_id])
    @group = Group.find(params[:group_id])
    @student = Student.find(params[:id])
    @tasks = Task.where(exam_id: params[:exam_id])
    # find scores? and then display form for them
    @scores = @student.scores
  end

  def update
    @exam = Exam.find(params[:exam_id])
    @group = Group.find(params[:group_id])
    @student = Student.find(params[:id])

    @student.update(score_params)

    redirect_to exam_group_path(@exam, @group)
  end

  private

  def generate_name
    next_student = Student.group(:group_id).count[params[:group_id].to_i] || 0
    "Uczeń #{next_student + 1}"
  end

  def score_params
    params.require(:student).permit(scores_attributes: [:score, :id])
  end
end
