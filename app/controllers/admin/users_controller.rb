class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @user.save
      redirect_to edit_admin_user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :password, :email, :role)
  end
end
