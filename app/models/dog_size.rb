class DogSize < ActiveHash::Base
  self.data = [
    { id: 1, name: '大型犬までOK', image: 'icons/big_dog.png' },
    { id: 2, name: '中型犬までOK',image: 'icons/middle_dog.png' },
    { id: 3, name: '小型犬までOK',image: 'icons/small_dog.png' },
]

  include ActiveHash::Associations
  has_many :spots
end