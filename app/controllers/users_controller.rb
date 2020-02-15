class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    
  end

  def show
    @user = User.find(params[:id])
  end

  def activities
    
  end

  private
  def user_params
    params.require(:user).permit(:name, gametitle_ids: [])
  end
end
