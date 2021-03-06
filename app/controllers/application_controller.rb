class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_current_user

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def ensure_current_user
    if !current_user
      flash[:alert] = 'You must sign in'
      redirect_to sign_in_path
    end
  end

  def disable_nav
    @disable_nav = true
  end

  def ensure_user_is_current_user
    if @current_user != @user
      flash[:alert] = 'You do not have access'
      redirect_to root_path
    end
  end

  # def ensure_coach
  #   if @current_user != @pick.user
  #     flash[:alert] = 'You do not have access'
  #     redirect_to root_path
  #   end
  # end

end
