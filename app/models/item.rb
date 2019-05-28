class Item < ApplicationRecord

belongs_to :category
has_many :comments
has_many :line_items
has_many :carts, through: :line_items

end
