class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    authenticate_user!

    unless current_user.admin?
      flash[:alert] = "管理者権限のあるユーザーのみがログイン可能です。"
      redirect_to root_path
    end
  end

  protected

  def current_user?(user)
    current_user.id == user.id
  end

  helper_method :current_user?
end
