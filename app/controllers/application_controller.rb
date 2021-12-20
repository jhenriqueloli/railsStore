class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_order 
    if user_signed_in?    
      if Order.where("user_id = ? and status = ?" , current_user.id, "Open").first.nil?
        @current_order = Order.create(user_id: current_user.id, status: "Open", amount: 0)
      else
        @current_order = Order.where("user_id = ? and status = ?" , current_user.id, "Open").first
      end
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :password, :password_confirmation])

  end 
end
