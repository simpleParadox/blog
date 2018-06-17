class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if(@article.save)
      # Do something
      flash[:notice] = "Article was successfully created !"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if(@article.update(article_params))
      # Do something
      flash[:notice] = "Article was successfully updated !"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  private
    def article_params
      # You need to  whitelist and article whenever you submit the form.
      params.require(:article).permit(:title, :description) # Whitelisting the article
    end
end
