class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
    @exam = Exam.find(params[:exam_id])
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      flash[:notice] = "Utworzono grupę!"
      redirect_to groups_path
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
    params.require(:group).permit(:name, :group_type)
  end
end
