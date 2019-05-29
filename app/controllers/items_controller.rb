class ItemsController < ApplicationController


	def show
		@item = Item.find(params[:item_id])
		@comment = Comment.new
	end

end