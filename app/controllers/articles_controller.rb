class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @new_article = Article.new(article_params)
    @new_article.save

    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @edit_article = Article.find(params[:id])
    @edit_article.update(article_params)

    redirect_to articles_path
  end

  def destroy
    @delete_article = Article.find(params[:id])
    @delete_article.destroy

    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
