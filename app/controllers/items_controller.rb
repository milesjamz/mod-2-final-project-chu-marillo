class ItemsController < ApplicationController


	def show
		@item = Item.find(params[:id])
		@comment = Comment.new
		@line_item = LineItem.new
	end

end