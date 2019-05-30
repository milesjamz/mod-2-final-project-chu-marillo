class LineItemsController < ApplicationController
 
def index
  @line_items = LineItem.all
end

def show
end

def new
  @line_item = LineItem.new
end

  def create
    current_active_cart = current_user.carts.last
    @item = Item.find(params[:line_item][:item_id])
    @line_item = current_active_cart.add_item(@item)
      if @line_item.save
        redirect_to current_active_cart
      else
        render :new
      end
  end

  def destroy
    @line_item.destroy
    redirect_to line_items_path
  end

  private

 def set_line_item
   @line_item = LineItem.find(params[:id])
 end

  def line_item_params
    params.require(:line_item).permit(:quantity, :item_id, :cart_id)
  end

end