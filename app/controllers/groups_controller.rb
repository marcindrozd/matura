class GroupsController < ApplicationController

  def index
    @exam = Exam.find(params[:exam_id])
    @groups = @exam.groups
  end

  def new
    @exam = Exam.find(params[:exam_id])
    @group = @exam.groups.new
  end

  def create
    @exam = Exam.find(params[:exam_id])
    @group = @exam.groups.new(group_params)

    if @group.save
      flash[:notice] = "Utworzono grupę!"
      redirect_to exam_groups_url(@exam)
    else
      render :new
    end
  end

  def show
    @exam = Exam.find(params[:exam_id])
    @group = Group.find(params[:id])
    @student = Student.new
  end

  def edit
    @exam = Exam.find(params[:exam_id])
    @group = Group.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:exam_id])
    @group = Group.find(params[:id])

    if @group.update(group_params)
      flash[:notice] = "Zaktualizowano grupę!"
      redirect_to exam_path(@exam)
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :kind)
  end
end
