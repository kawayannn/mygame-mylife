class CommentsController < ApplicationController

  def create
    # binding.pry
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
  end

  private
  
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id )
  end

end
