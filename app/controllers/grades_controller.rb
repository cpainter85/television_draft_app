class GradesController < ApplicationController

  def index
    @users = User.all
    @picks = Pick.all
    @round = 1
  end

  def edit
    @pick = Pick.find(params[:pick_id])
    @grade = @pick.grades.find(params[:id])
  end

  def update
    @pick = Pick.find(params[:pick_id])
    @grade = @pick.grades.find(params[:id])
    if @grade.update(params.require(:grade).permit(:grade))
      redirect_to grades_path, notice: "Grade for #{@pick.name} successfully submited!"
    else
      render :edit
    end
  end
end
