class ArticlesController < ApplicationController
  def new
    @article = Article.new
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

  def show
    @article = Article.find(params[:id])
  end
  private
    def article_params
      params.require(:article).permit(:title, :description) # Whitelisting the article

    end
end
