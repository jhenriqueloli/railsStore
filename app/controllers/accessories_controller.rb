class AccessoriesController < ApplicationController
  before_action :set_accessory, only: %i[ show edit update destroy ]

  # GET /accessories or /accessories.json
  def index
    @accessories = Accessory.all
    
    respond_to do |format|
      format.html
      format.json { render json: @accessories }
    end
  end

   # GET /accessories/1 or /accessories/1.json
   def show
    @accessory = Accessory.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => { :accessory => @accessory } }
    end
  end

  # GET /accessories/new
  def new
    @accessory = Accessory.new
  end

  # GET /accessories/1/edit
  def edit
  end

  # POST /accessories or /accessories.json
  def create
    @accessory = Accessory.new(accessory_params.merge(:code => Time.now.to_i))

    respond_to do |format|
      if @accessory.save
        format.html { redirect_to products_path, notice: "Accessory was successfully created." }
        format.json { render :show, status: :created, location: @accessory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accessories/1 or /accessories/1.json
  def update
    respond_to do |format|
      if @accessory.update(accessory_params)
        format.html { redirect_to products_path, notice: "Accessory was successfully updated." }
        format.json { render :show, status: :ok, location: @accessory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accessories/1 or /accessories/1.json
  def destroy
    @accessory.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Accessory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accessory
      @accessory = Accessory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accessory_params
      params.require(:accessory).permit(:name, :brand, :price, :quantity )
    end
end
