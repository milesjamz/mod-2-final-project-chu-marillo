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
    this_item = Item.find(params[:line_item][:item_id])
    @line_item = current_active_cart.add_item(this_item, params[:line_item][:quantity])
      if @line_item.save
        redirect_to current_active_cart
      else
        redirect_to item_path(this_item)
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