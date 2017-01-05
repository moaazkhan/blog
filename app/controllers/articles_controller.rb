class ArticlesController < ApplicationController
  def index
    @articles = Article.all.to_a
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to action: :index
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
