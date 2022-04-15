class Comment < ApplicationRecord
  before_save :default_image

  validates :content, presence: true

  belongs_to :user
  belongs_to :spot
  has_one_attached :comment_image 

  def default_image
    if !self.comment_image.attached?
      self.comment_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'no_image.jpg')), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
  end
end
