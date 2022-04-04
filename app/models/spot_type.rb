class SpotType < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, 
    { id: 2, name: 'レストラン・カフェ' },
    { id: 3, name: '公園・ドッグラン' },
    { id: 4, name: 'ホテル・旅館' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :spots
end