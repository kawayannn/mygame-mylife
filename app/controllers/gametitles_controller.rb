class GametitlesController < ApplicationController
  def index
    
  end

  def search
    return nil if params[:keyword] == ""
    @result = Gametitle.where("name LIKE ?", "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end
end
