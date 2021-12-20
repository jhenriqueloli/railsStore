class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]
  
  def home
    query = "quantity > ?", 0
    query = "quantity > ? and name LIKE ?", 0 ,"%#{params[:search][:search]}%" if params[:search]
    @products = Vape.where(query) + Essence.where(query) + Accessory.where(query)
    @products = @products.sort_by{ |h| h[:updated_at] }.reverse
    @products = @products.paginate(:page => params[:page], :per_page => 8) 
    
    respond_to do |format|
      format.html
      format.json { render :json => { :products => @products } }
    end
  end
end
