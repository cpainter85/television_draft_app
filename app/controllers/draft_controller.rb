class DraftController < ApplicationController
  def index
    @users = User.all
  end
end
