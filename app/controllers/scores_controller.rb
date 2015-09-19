class ScoresController < ApplicationController

  def index
    @exam = Exam.find(params[:exam_id])
    @group = @exam.groups.first
    @tasks = @exam.tasks
    @students = @group.students
  end

  def update
  end
end