class ArticlesController < ApplicationController
  def index
    @articles = Article.all.to_a
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @new_comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    Article.create!(article_params)
    redirect_to action: :index
  end

  def create_comment
    # Find the article using the id param passed in route
    @article = Article.find(params[:id])

    # Initialize a new Comment with content params
    @comment = Comment.new(comment_params)

    # Assign the comment to our current article
    @comment.article_id = @article.id

    # Finally save the comment
    @comment.save

    # Redirect to the current article page (/articles/current-id)
    redirect_to action: :show
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
