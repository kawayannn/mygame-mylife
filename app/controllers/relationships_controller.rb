class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    user = User.find(params[:relationship][:follow_id])
    following = current_user.follow(user)
    if following.save
      flash[:success] = 'フォローしました'
      redirect_to user
    else
      flash.now[:alert] = 'フォローに失敗しました'
      redirect_to user
    end
  end

  private

  def set_user
    user = User.find(params[:relationship][:follow_id])
  end
end
