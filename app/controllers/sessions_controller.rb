class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(name: params[:name])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
  		redirect_to user_path(@user)
		else
			flash[:error] = @user.errors.full_messages
			flash[:error] << "Please check your username and password" 
			redirect_to login_path
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
