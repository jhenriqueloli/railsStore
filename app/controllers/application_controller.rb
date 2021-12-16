class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper_method :current_user, :logged_in?, :current_order

  def current_user
    @curent_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def current_order 
    if logged_in?    
      if Order.where("user_id = ? and status = ?" , current_user.id, "Open").first.nil?
        @current_order = Order.create(user_id: current_user.id, status: "Open", amount: 0)
      else
        @current_order = Order.where("user_id = ? and status = ?" , current_user.id, "Open").first
      end
    end
  end

end
