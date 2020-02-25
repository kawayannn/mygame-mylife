class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
      unless @user.id == current_user.id
        redirect_to edit_user_path(current_user.id)
      end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
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
    params.require(:user).permit(:name, :introduction, gametitle_ids: [])
  end
end
