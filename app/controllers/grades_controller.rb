class GradesController < ApplicationController
  def index
    @picks = Pick.all
    @round = 1
  end
end
