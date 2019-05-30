class LineItem < ApplicationRecord

belongs_to :item
belongs_to :cart


  def total_price
    item.price.to_i * quantity.to_i
  end

def add_quantity
  @line_item = LineItem.find(params[:id])
  @line_item.quantity += 1
  @line_item.save
  redirect_to cart_path(@current_cart)
end

def reduce_quantity
  @line_item = LineItem.find(params[:id])
  if @line_item.quantity > 1
    @line_item.quantity -= 1
  end
  @line_item.save
  redirect_to cart_path(@current_cart)
end

end
