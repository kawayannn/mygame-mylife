class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :set_gametitles
  impressionist :actions=> [:show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = params[:gametitle_id].present? ? Gametitle.find(params[:gametitle_id]).articles.order(created_at: :DESC) : Article.order(created_at: :DESC)
    @result = params[:gametitle_id].present? ? Gametitle.find(params[:gametitle_id]) : ""
    @rank = params[:gametitle_id].present? ? Gametitle.find(params[:gametitle_id]).articles.order(impressions_count: :desc).take(5) : Article.order(impressions_count: :desc).take(5)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
    @like = Like.new
    impressionist(@article, nil, unique: [:session_hash])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :image, gametitle_ids: []).merge(user_id: current_user.id)
    end

    def set_gametitles
      @gametitles = Gametitle.all
    end
    
end
