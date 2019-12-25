class GametitlesController < ApplicationController
  def index
    
  end

  def search
    @result = Gametitle.where("name LIKE ?", "%#{params[:keyword]}%")
  end
end
