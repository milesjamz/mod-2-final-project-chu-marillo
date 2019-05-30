class Item < ApplicationRecord

belongs_to :category
has_many :comments
has_many :line_items
has_many :carts, through: :line_items


  private

   def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line items present')
      throw :abort
    end
   end


end