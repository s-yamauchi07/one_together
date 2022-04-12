class GonePlacesController < ApplicationController
  before_action :set_spot, only: [:create, :destroy]

  def create
    gone_places = GonePlace.new(user_id: current_user.id, spot_id: @spot.id)
    gone_places.save
  end

  def destroy
    gone_places =  GonePlace.find(params[:id])
    gone_places.destroy
  end

  private
  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
