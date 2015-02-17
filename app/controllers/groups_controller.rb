class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def new
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
    @group = Group.find(params[:id])
    @student = Student.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      flash[:notice] = "Zaktualizowan grupę!"
      redirect_to @group
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :group_type)
  end
end
