class Spot < ApplicationRecord
  geocoded_by :address
  before_validation :geocode
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :gone_places, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :spot_tag_relations
  has_many :tags, through: :spot_tag_relations
  has_one_attached :spot_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :spot_type
  belongs_to :dog_permission
  belongs_to :dog_size

  def favorited_by?(user, spot)
    Favorite.where(user_id: user.id, spot_id: spot.id).exists?
  end

  def gone_place_by?(user, spot)
    GonePlace.where(user_id: user, spot_id: spot.id).exists?
  end
end
