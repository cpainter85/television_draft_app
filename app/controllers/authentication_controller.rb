class AuthenticationController < ApplicationController

  skip_before_action :ensure_current_user

  def new

  end

  def create
    user = User.find_by(email: params[:email])
binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to draft_path
    else
      flash[:notice] = 'Invalid User/Password combination'
      render :new
    end
  end
end
