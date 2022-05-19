class DogPermission < ActiveHash::Base
  self.data = [
    { id: 1, name: '同伴可' ,image: 'icons/good.png'},
    { id: 2, name: '一部のみ可',image: 'icons/teracce.png' },
]

  include ActiveHash::Associations
  has_many :spots
end