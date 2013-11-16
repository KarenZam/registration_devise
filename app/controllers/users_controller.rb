class UsersController < ApplicationController

  def index
    @users = User.all.entries
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id]) 
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.create(user_params)
    
    redirect_to user_url(@user)
  end

  def update
    @user = User.find_by(id: params[:id])
    
    redirect_to user_url(@user)
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    
    redirect_to users_url
  end

  private
  
  def user_params
    params.require(:user).permit(
      :name
    )

  end
  
end
