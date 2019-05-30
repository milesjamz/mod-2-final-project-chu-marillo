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
      if @cart.update(cart_params)
        redirect_to @cart
      else
        render :new
      end
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