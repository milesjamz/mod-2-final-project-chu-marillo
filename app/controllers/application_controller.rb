class ApplicationController < ActionController::Base

  helper_method :current_user, :current_active_cart

  def current_user
    User.where(id: session[:user_id]).first
  end

  def current_active_cart
    Cart.where(status: "active").first
  end
end
