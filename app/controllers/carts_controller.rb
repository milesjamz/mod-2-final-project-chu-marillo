class CartsController < ApplicationController


def show
	@cart = Cart.find(params[:id])
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

end
