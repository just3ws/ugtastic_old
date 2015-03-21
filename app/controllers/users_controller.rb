class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    redirect_to :back, alert: 'Access denied.' unless @user == current_user || current_user.admin?
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to :back, notice: 'User updated.'
    else
      redirect_to :back, alert: 'Unable to update user.'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end

  private

  def admin_only
    redirect_to :back, alert: 'Access denied.' unless current_user.admin?
  end

  def secure_params
    if @user == current_user
      params.require(:user).permit(:email)
    elsif current_user.admin?
      params.require(:user).permit(:role)
    end
  end
end
