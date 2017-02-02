class ArticlesController < ApplicationController
  # this applies user authentication on all pages except main index page and article show page
  # i.e any one can see the articles content but cant create
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @articles = Article.all.to_a
  end

  def show
    # Used find by slug instead of id when article title is created a slug is generated automatically
    @article = Article.find_by(slug: params[:slug])
    #
    @comments = @article.comments
    @new_comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    # .create is used to create article using its parameter which are defined as article_params (see below)
    @article = Article.new(article_params)
    if @article.save
      # Redirecting to the main page when article is created so user can see it.
      flash[:success] = "Successfully created new Article"
      redirect_to action: :index
    else
      flash[:error] = @article.errors.full_messages.join(', ')
      render action: :new
    end
  end

  def create_comment
    # Find the article using the id param passed in route
    @article = Article.find_by(slug: params[:slug])

    # Initialize a new Comment with content params
    @comment = Comment.new(comment_params)

    # Assign the comment to our current article
    @comment.article_id = @article.id

    #Assign the User who created the comment
    @comment.user =  current_user

    # Finally save the comment
    @comment.save

    # Redirect to the current article page (/articles/current-id)
    redirect_to action: :show
  end

  private

  def article_params
    # the parameters for new article creation
    params.require(:article).permit(:title, :content)
  end

  def comment_params
    # the parameters for new comment creation
    params.require(:comment).permit(:content)
  end
end
