class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.find_by(name: params[:user][:name])
		user = user.try(:authenticate, params[:user][:password])
		return redirect_to(controller: 'users', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to controller: 'users', action: 'show'
	end


end