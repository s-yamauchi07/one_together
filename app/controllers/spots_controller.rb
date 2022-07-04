class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :search_spot, only: [:index, :search]
  
  def index
    @spots = Spot.order(created_at: :desc).limit(5)
    @tags = Tag.limit(10)
  end

  def new
    @spot_tag = SpotTag.new
  end

  def create
    @spot_tag = SpotTag.new(set_address)
    @spot_tag.valid?
    if @spot_tag.save
      redirect_to spots_path
    else
      render :new
    end
  end

  def show
    gon.spot = @spot
    @comment = Comment.new
    @comments = @spot.comments.includes(:user).order(created_at: :desc)
    @tags = @spot.tags
  end

  def edit
    spot_tag_attributes = @spot.attributes
    @spot_tag = SpotTag.new(spot_tag_attributes)
  end
  
  def update
    @spot_tag = SpotTag.new(set_address)
    @spot_tag.spot_images ||= @spot.spot_images.blobs
    @spot_tag.latitude ||= @spot.latitude
    @spot_tag.longitude ||= @spot.longitude


    if @spot_tag.valid?
      @spot_tag.update(set_address,@spot)
      redirect_to spot_path(@spot)
    else
      render :edit
    end
  end

  def destroy
    if @spot.destroy
      flash[:notice] = "スポット削除をしました。"
      redirect_to spots_path
    else
      render :show
    end
  end

  def search
    @results = @q.result
    gon.spots = @results
    # マーカーとの数字を合わせるため初期値設定
    @spot_num = 1
  end

  def tag_search
    return nil if params[:keyword] == ""
    tag = Tag.where('tag_name LIKE ?', "%#{params[:keyword]}%")
    render json: {keyword: tag}
  end

  private

  def set_address
    params.require(:spot_tag).permit(:name, :phone_number, :website, :address, :latitude, :longitude, :prefecture_id, :spot_type_id, :dog_permission_id, :comment, :dog_size_id, tag_ids: [],spot_images: []).merge(user_id: current_user.id)
  end

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def search_spot
    @q = Spot.ransack(params[:q])
  end
end
