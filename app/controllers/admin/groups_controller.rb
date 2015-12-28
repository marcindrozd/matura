class Admin::GroupsController < Admin::BaseController
  load_and_authorize_resource through: :current_exam

  def index
  end

  def new
  end

  def create
    if @group.save
      redirect_to edit_admin_group_path(@group), notice: t('.group_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to edit_admin_group_path(@group), notice: t('.group_updated')
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to admin_groups_path, notice: t('.group_destroyed')
  end

  private

  def group_params
    params.require(:group).permit(:name, :kind)
  end
end
