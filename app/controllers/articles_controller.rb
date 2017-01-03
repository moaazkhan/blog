class ArticlesController < ApplicationController
  def index
    @articles = Article.all.to_a
  end

  def show
    @article = Article.find(params[:id])
  end
end
