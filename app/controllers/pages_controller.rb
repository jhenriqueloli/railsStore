class PagesController < ApplicationController
  def home

      query = "quantity > ?", 0
      query = "quantity > ? and name LIKE ?", 0 ,"%#{params[:search][:search]}%" if params[:search]
      @products = Vape.where(query) + Essence.where(query) + Accessory.where(query)
      @products = @products.sort_by &:created_at

      respond_to do |format|
        format.html
        format.json { render json: @products }
      end

  end
end
