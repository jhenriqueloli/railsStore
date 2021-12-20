class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new]

  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :require_same_user, only: %i[ show edit update destroy ]
  before_action :require_admin, only: %i[ show ]

  # GET /users or /users.json
  def index
    @users = User.paginate(page: params[:page], per_page: 10)

    respond_to do |format|
      format.html
      format.json { render :json => { :users => @users } }
    end

  end

  # GET /users/1 or /users/1.json
  def show
  end

    
end
