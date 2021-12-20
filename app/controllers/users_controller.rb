class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new]

  # GET /users or /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.json { render :json => { :users => @users } }
    end

  end

  def admin
    @user = User.find(params[:format])
    @user.toggle(:admin)

    respond_to do |format|
      if @user.save 
        format.html do
          redirect_to '/'
        end
        format.json { render json: @user.to_json }
      else
        format.html { render 'new'} ## Specify the format in which you are rendering "new" page
        format.json { render json: @reservation.errors } ## You might want to specify a json format as well
      end
    end
  end

  # GET /users/1 or /users/1.json
  def show
  end

    
end
