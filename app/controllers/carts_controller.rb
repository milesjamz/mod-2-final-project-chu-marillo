class CartsController < ApplicationController


def show
	@cart = Cart.find(params[:id])
    @line_items = Cart.last.line_items
end

def new
	@cart = Cart.new
end

def create
	@cart = Cart.new(cart_params)
end

  def update
    current_active_cart.update(:status => false)
    @cart = Cart.create(user_id: current_user.id, total_price: 0,  status: true)
    current_active_cart = @cart
    redirect_to user_path(current_user)
  end

  def destroy
    @cart = current_active_cart
    @cart.line_items.delete_all
    redirect_to cart_path(current_user.carts.last)
  end

private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "That cart doesn't exist"
    end

def cart_params
	params.require(:cart).permit(:quantity, :status, :line_item_id, :user_id)
end

end