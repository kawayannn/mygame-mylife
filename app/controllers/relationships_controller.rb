class RelationshipsController < ApplicationController
  before_action :set_user

  private

  def set_user
    user = User.find(params[:relationship][:follow_id])
  end
end
