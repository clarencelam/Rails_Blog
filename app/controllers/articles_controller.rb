class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  # "show" action calls Article.find
  def show
    @article = Article.find(params[:id])
  end

  # "new" action shows the view for creating a new article
  def new
    @article = Article.new
  end

  # action to create anew article and save it
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # action to edit an article
  def edit
    @article = Article.find(params[:id])
  end

  # action to apply an edit to an article
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  #private method to specify and guard what params are ingested
  private 
    def article_params
      params.require(:article).permit(:title, :body)
    end

end
