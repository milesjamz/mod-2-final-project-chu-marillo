class Item < ApplicationRecord

belongs_to :category
has_many :comments
has_many :line_items
has_many :carts, through: :line_items


def addme(item_id, current_user)
	if session[:user][:cart] = open
		lineitem.build WHERE the lineitem is the same as this item
	else
		Cart.create that gets associated with this user
		AND this item is added to the cart


end
