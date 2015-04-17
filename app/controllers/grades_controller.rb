class GradesController < ApplicationController
  def index
    @users = User.all
    @round = 1
  end
end
