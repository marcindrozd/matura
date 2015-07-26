class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      redirect_to exams_path, notice: 'Dodano egzamin'
    else
      render :new
    end
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
  end

  private

  def exam_params
    params.require(:exam).permit(:year)
  end
end
