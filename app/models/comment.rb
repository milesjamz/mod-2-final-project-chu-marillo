class Comment < ApplicationRecord

validates :rating, :inclusion => 1..10

belongs_to :user
belongs_to :item

# def add_me
# end

	
end
