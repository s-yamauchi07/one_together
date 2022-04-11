class FavoritesController < ApplicationController
  before_action :set_spot, only: [:create, :destroy]

  def create
    favorite = Favorite.new(user_id: current_user.id, spot_id: @spot.id)
    favorite.save
  end

  def destroy
    favorite =  Favorite.find(params[:id])
    favorite.destroy
  end

  private
  def set_spot
    @spot = Spot.find(params[:spot_id])
  end
end
