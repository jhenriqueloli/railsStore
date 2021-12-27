class EssencesController < ApplicationController
  before_action :set_essence, only: %i[ show edit update destroy ]
  before_action :require_admin, expect: %i[show]

  # GET /essences/1 or /essences/1.json
  def index
    @essences = Essence.all
    
    respond_to do |format|
      format.html
      format.json { render :json => { :essences => @essences } }
    end
  end

  # GET /essence/1 or /essence/1.json
  def show
    @essence = Essence.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => { :essence => @essence } }
    end
  end

  # GET /essence/new
  def new
    @essence = Essence.new
  end

  # GET /essence/1/edit
  def edit
  end

  # POST /essence or /essence.json
  def create
    @essence = Essence.new(essence_params.merge(:code => Time.now.to_i))

    respond_to do |format|
      if @essence.save
        format.html { redirect_to products_path, notice: "Essence was successfully created." }
        format.json { render :show, status: :created, location: @essence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @essence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /essence/1 or /essence/1.json
  def update
    respond_to do |format|
      if @essence.update(essence_params)
        format.html { redirect_to products_path, notice: "Essence was successfully updated." }
        format.json { render :show, status: :ok, location: @essence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @essence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /essence/1 or /essence/1.json
  def destroy
    @essence.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: "Essence was successfully removed." }
      format.json { head :no_content }
    end
  end

  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_essence
    @essence = Essence.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def essence_params
    params.require(:essence).permit(:name, :brand, :flavor, :price, :strength, :size, :quantity )
  end

  def require_admin
    if !current_user.admin?
      redirect_to root_path  
    end
  end

end
