class Spot < ApplicationRecord
  geocoded_by :address
  before_validation :geocode
  belongs_to :user
  has_many :favorites
  has_many :gone_places
  has_one_attached :spot_image

  with_options presence: true do
    validates :name
    validates :phone_number
    validates :website
    validates :address
    validates :latitude
    validates :longitude
    validates :spot_image
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :prefecture_id
    validates :spot_type_id
    validates :dog_permission_id
  end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :spot_type
  belongs_to :dog_permission

  def favorited_by?(user)
    Favorite.where(user_id: user).exists?
  end

  def gone_place_by?(user)
    GonePlace.where(user_id: user).exists?
  end
end
