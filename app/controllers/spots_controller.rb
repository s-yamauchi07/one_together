class SpotsController < ApplicationController
  def index
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(set_address)
    if @spot.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_address
    params.require(:spot).permit(:name, :phone_number, :website, :address, :latitude, :longitude, :prefecture_id, :spot_type_id, :dog_permission_id, :spot_image).merge(user_id: current_user.id)
  end
end
