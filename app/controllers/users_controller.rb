class UsersController < ApplicationController
   # before_action :set_user, only: %i[show create update destroy]
   # before_action :authenticate_user!
    def index
      @users = User.all
    end
  
    def show
      set_user
    
    end
  
    def new
      @user = User.new
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def create
      @user = User.new(set_params)
        respond_to do |format|
        if @user.save
          format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
    def destroy
      @user.destroy
        respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
  
    def logout_user
     
    end
  
    def set_user
      @user = User.find_by(id: params[:id])
    end
  
    def set_params
      params.require(:user).permit(:name, :photo, :bio, :postscounter)
    end
  end
  