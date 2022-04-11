class SpotsController < ApplicationController
  before_action :set_spot, only: :show

  def index
    @spots = Spot.all.order(created_at: :desc).limit(5)
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(set_address)
    if @spot.save
      redirect_to spots_path
    else
      render :new
    end
  end

  def show
    gon.spot = @spot
  end



  private

  def set_address
    params.require(:spot).permit(:name, :phone_number, :website, :address, :latitude, :longitude, :prefecture_id, :spot_type_id, :dog_permission_id, :comment,:spot_image).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end
end
