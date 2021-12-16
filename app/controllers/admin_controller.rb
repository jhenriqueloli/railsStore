class AdminController < ApplicationController
  before_action :require_admin

  # GET /users or /users.json
  def index
    @vapers = Vape.paginate(page: params[:page], per_page: 5)
    @essences = Essence.paginate(page: params[:page], per_page: 5)
    @accessories = Accessory.paginate(page: params[:page], per_page: 5)

    respond_to do |format|
      format.html
      format.json { render :json => { :accessories => @accessories, 
                                      :essences => @essences, 
                                      :vapers => @vapers 
                                     }
                  }
    end
  end

  private
    
    def require_admin
      if !current_user.admin?
        redirect_to root_path  
      end
    end

end
