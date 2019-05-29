class ItemsController < ApplicationController


	def show
		@item = Item.find(params[:id])
		@comment = Comment.new
	end

end