class SpotType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, 
    { id: 2, name: 'レストラン・カフェ', image:'icons/cafe.png' },
    { id: 3, name: '公園・ドッグラン', image:'icons/park.png' },
    { id: 4, name: 'ホテル・旅館', image:'icons/hotel.png' },
    { id: 5, name: 'その他', image:'No image' },
  ]

  include ActiveHash::Associations
  has_many :spots
end