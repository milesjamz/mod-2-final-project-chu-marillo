class LineItemsController < ApplicationController
 
  def create
    @cart = Cart.new
    @cart.save
    @line_item = LineItem.new(line_item_params)
    @line_item.cart_id = @cart.id
    @cart.save
        
    # redirect_to user_path(@user)
    byebug
    redirect_to user_path(6)
  end


  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :item_id, :cart_id)
  end
end