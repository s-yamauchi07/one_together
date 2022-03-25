class SpotsController < ApplicationController
  def index
  end

  def new
    @spot = Spot.new
  end

  def create
    binding.pry
  end
end
