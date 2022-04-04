class Spot < ApplicationRecord
  geocoded_by :address
  before_validation :geocode

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

  belongs_to :user
  has_one_attached :spot_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :spot_type
  belongs_to :dog_permission
end
