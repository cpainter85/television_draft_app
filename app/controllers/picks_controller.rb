class PicksController < ApplicationController
  def new
    @pick = @current_user.picks.new
  end

  def create
    @pick = @current_user.picks.new(params.require(:pick).permit(:name, :show, :position_id, :comment))
    @pick.round = @current_user.picks.count+1
    if @pick.save
      redirect_to root_path, notice: "#{@pick.name} has been added to your team!"
    else
      render :new
    end
  end
end
