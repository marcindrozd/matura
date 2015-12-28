class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @user.save
      redirect_to edit_admin_user_path(@user), notice: t('.user_created')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_admin_user_path(@user), notice: t('.user_updated')
    else
      render :edit
    end
  end

  private

  def user_params
    allow_empty_password
    params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation, :email, :role, group_ids: [])
  end

  def allow_empty_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
end
