class CartsController < ApplicationController


def show
	@cart = Cart.find(params[:id])
    @line_items = current_cart.line_items
end

def new
	@cart = Cart.new
end

def create
	@cart = Cart.new(cart_params)
end

def update
	@cart.assign_attributes(params[:cart])
	@cart.save
end

private

def cart_params
	params.require(:cart).permit(:quantity, :status, :line_item_id)

end
