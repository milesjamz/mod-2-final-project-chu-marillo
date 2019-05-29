class User < ApplicationRecord

has_many :carts

  has_secure_password

end
