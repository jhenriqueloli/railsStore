class CartController < ApplicationController
  def show
    @order_items = current_order.order_items.paginate(page: params[:page], per_page: 10)
    @order = current_order
    
    respond_to do |format|
      format.html
      format.json { render :json => { :order => @order, 
                                      :order_items => @order_items
                                     }
                  }
    end
    
  end
end
