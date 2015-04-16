class PicksController < ApplicationController

  def new
    @pick = @current_user.picks.new
  end

  def create
    @pick = @current_user.picks.new(params.require(:pick).permit(:name, :show, :position_id))
    @pick.round = @current_user.picks.count+1
    if @pick.save
      redirect_to root_path, notice: "#{@pick.name} has been added to your team!"
    else
      render :new
    end
  end

  def edit
    @pick = @current_user.picks.find(params[:id])
  end

  def update
    @pick = @current_user.picks.find(params[:id])
    if @pick.update(params.require(:pick).permit(:name, :show, :position_id))
      redirect_to user_path(@current_user), notice: "#{@pick.name} successfully updated"
    else
      render :edit
    end
  end

end
