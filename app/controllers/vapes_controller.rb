class VapesController < ApplicationController
  before_action :set_vape, only: %i[ show edit update destroy ]
  before_action :require_admin, expect: %i[show]

  # GET /vapes/1 or /vapes/1.json
  def show
    @vape = Vape.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => { :vape => @vape } }
    end
  end

  # GET /vapes/new
  def new
    @vape = Vape.new
  end

  # GET /vapes/1/edit
  def edit
  end

  # POST /vapes or /vapes.json
  def create
    @vape = Vape.new(vape_params.merge(:code => Time.now.to_i))
    
    respond_to do |format|
      if @vape.save
        format.html { redirect_to products_path, notice: "Vape was successfully created." }
        format.json { render :show, status: :created, location: @vape }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vape.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vapes/1 or /vapes/1.json
  def update
    respond_to do |format|
      if @vape.update(vape_params)
        format.html { redirect_to products_path, notice: "Vape was successfully updated." }
        format.json { render :show, status: :ok, location: @vape }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vape.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vapes/1 or /vapes/1.json
  def destroy
    @vape.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Vape was successfully removed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vape
      @vape = Vape.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vape_params
      params.require(:vape).permit(:name, :brand, :warrancy, :price, :quantity)
    end

    def require_admin
      if !current_user.admin?
        redirect_to root_path  
      end
    end

end
