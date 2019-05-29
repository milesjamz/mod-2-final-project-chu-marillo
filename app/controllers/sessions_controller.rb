class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		# byebug
		user = User.find_by(name: params[:user][:name])
		user = user.try(:authenticate, params[:user][:password])
		return redirect_to(controller: 'users', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    # redirect_to controller: 'users', action: 'show'
    redirect_to user_path(@user)
	end


  # def create
  #   user = User.find_by(params[:email])
  #   if user && user.authenticate(params[:password])
  #     session[:user_id] = user.id
  #     redirect_to root_url, notice: "Logged in!"
  #   else
  #     flash.now[:alert] = "Email or password is invalid"
  #     render "new"
  #   end
  # end


end
