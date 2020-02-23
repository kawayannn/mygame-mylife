class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def edit
    
  end

  def create
    
  end

  def show
    @user = User.find(params[:id])
    @messages = @user.messages
    @comments = @user.comments
    @activities = (@messages + @comments).sort_by{|activities| activities.created_at}.reverse.take(10)
  end

  def activities
    @user = User.find(params[:user_id])
    @messages = @user.messages
    @comments = @user.comments
    @activities = (@messages + @comments).sort_by{|activities| activities.created_at}.reverse.take(10)
  end

  def followings
    @user = User.find(params[:user_id])
    @followings = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @followers = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, gametitle_ids: [])
  end
end
