class UsersController < ApplicationController

	def profile
	end

	def show
		@user = User.find(params[:id])
		@item = Item.new
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)

		if @user.valid? && @user.authenticate(params[:password])
			redirect_to user_path(@user)

		else
			flash[:error] = @user.errors.full_messages
			redirect_to new_user_path
		end
	end

	def destroy

	end

	private
	def user_params
		params.require(:user).permit(:name, :password)
	end

end
