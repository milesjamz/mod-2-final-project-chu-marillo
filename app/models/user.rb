class User < ApplicationRecord

validates_uniqueness_of :name
has_many :carts
has_many :line_items, through: :carts
has_many :comments
has_many :items, through: :comments

  has_secure_password


end
