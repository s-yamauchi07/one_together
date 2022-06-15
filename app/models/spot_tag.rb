class SpotTag
  include ActiveModel::Model
  attr_accessor :name, :phone_number, :website, :address, :latitude, :longitude, :prefecture_id, :spot_type_id, :dog_permission_id, :comment,:spot_images,:dog_size_id, :user_id, :tag_name, :tag_ids

  # spotモデル/tagモデルのバリデーション
  with_options presence: true do
    validates :name
    validates :phone_number
    validates :website
    validates :address
    validates :latitude
    validates :longitude
    validates :spot_images
  end

  # with_options numericality: { message: "can't be blank"} do
  #   validates :prefecture_id
  #   validates :spot_type_id
  #   validates :dog_permission_id
  # end


  def save
    spot = Spot.create(name: name, 
                        phone_number: phone_number,
                        website: website,
                        address: address,
                        latitude: latitude,
                        longitude: longitude,
                        prefecture_id: prefecture_id, 
                        spot_type_id: spot_type_id,
                        dog_permission_id: dog_permission_id,
                        comment: comment,
                        spot_images: spot_images,
                        dog_size_id: dog_size_id,
                        user_id: user_id
    )

    # タグの保存。first_or_initializeで既に保存済みのタグかを確認。
    tag_ids.each do |tag_name|
      tag = Tag.where(tag_name: tag_name).first_or_initialize
      tag.save

      # 中間テーブルへの保存
      SpotTagRelation.create(spot_id: spot.id, tag_id: tag.id)
    end

  end

end