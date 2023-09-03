class ParksController < ApplicationController
  def index
    @facade = ParksFacade.new(params[:state])
  end
end