class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
    	@user = user
  		redirect_to user_path(@user)
		else
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
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
