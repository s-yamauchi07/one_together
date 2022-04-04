class DogPermission < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, 
    { id: 2, name: '大型犬OK' },
    { id: 3, name: '中型犬OK' },
    { id: 4, name: '小型犬OK' },
]

  include ActiveHash::Associations
  has_many :spots
end