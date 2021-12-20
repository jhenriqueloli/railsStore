class OrderItemsController < ApplicationController
  before_action :set_order
  
  def create
    @order_item = @order.order_items.new(order_params)
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to root_path, notice: "Product added successfully to your cart." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order_item = @order.order_items.where("code = ?", params[:code]).first
    @order_item.update_attributes(order_params)
    @order_items = @order.order_items
  end

  def destroy
    @order_item = @order.order_items.find(params[:id])
    
    respond_to do |format|
      if @order_item.destroy
        format.html { redirect_to cart_url, notice: "Product removed successfully from your cart." }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  def order_params
    params.require(:order_item).permit(:code, :quantity, :price)
  end

  def set_order
    redirect_to signup_path and return if !user_signed_in?
    if Order.where("user_id = ? and status = ?" , current_user.id, "Open").first.nil?
      @order = Order.new(:user_id => current_user.id, :status => "Open", :amount => "0")
      @order.save
    else
      @order = Order.where("user_id = ? and status = ?" , current_user.id, "Open").first
    end
  end

end
