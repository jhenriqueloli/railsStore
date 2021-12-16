class OrdersController < ApplicationController
  before_action :set_order
  
  # GET /vapes/1 or /vapes/1.json
  def index
    @orders = Order.where("user_id = ? and status != ?" , current_user.id, "Open").all.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.json { render :json => { :orders => @orders } }
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders or /orders.json
  def create
    if Order.where("user_id = ? and status = ?" , current_user.id, "Open").nil?
      @order = Order.new(user_id: current_user.id, status: "Open", amount: 0)
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to root_path, notice: "Thank you for your purchase, we are processing it and will e-mail you when the status is updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = current_order
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id, :status, :amount)    
    end

    
end
