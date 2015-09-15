class ScoresController < ApplicationController

  def index
    @exam = Exam.find(params[:exam_id])
    @group = @exam.groups.first
    @students = @group.students
  end

  def update
  end
end