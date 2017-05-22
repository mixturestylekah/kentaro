class UsersController < ApplicationController
  before_action :set_user, only: :show

  def show
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :name)
  end
end
