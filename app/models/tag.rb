class Tag < ApplicationRecord
  has_many :spot_tag_relations
  has_many :spots, through: :spot_tag_relations

  validates :tag_name, uniqueness: true
end
