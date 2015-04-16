class DraftController < ApplicationController
  def index
    @users = User.all
    @round = 1
  end
end
