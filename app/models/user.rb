class User < ApplicationRecord

validates_uniqueness_of :name
has_many :carts
has_many :items

  has_secure_password

end
