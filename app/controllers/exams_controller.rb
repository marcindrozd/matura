class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def show
    @exam = Exam.find(params[:id])
    @groups = @exam.groups
  end

  def scores
    @exam = Exam.find(params[:id])
    @students = Student.all
    @tasks = @exam.tasks
  end

  def update
    binding.pry
  end
end
