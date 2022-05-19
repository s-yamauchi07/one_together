class SpotType < ActiveHash::Base
  self.data = [
    { id: 1, name: 'レストラン・カフェ', image:'icons/cafe.png' },
    { id: 2, name: '公園・ドッグラン', image:'icons/park.png' },
    { id: 3, name: 'ホテル・旅館', image:'icons/hotel.png' },
    { id: 4, name: 'その他', image:'icons/no_image.png' },
  ]

  include ActiveHash::Associations
  has_many :spots
end