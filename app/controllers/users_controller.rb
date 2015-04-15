class UsersController < ApplicationController

  before_action :find_user
  before_action :ensure_user_is_current_user, except: [:show]

  def show
  end

  def edit
  end

  def update
    if @user.update(params.require(:user).permit(:password))
      redirect_to user_path(@user), notice: "Successfully changed password!"
    else
      render :edit
    end
  end

  private

  def find_user
    @user = User.find(params[:id])

  end
end
