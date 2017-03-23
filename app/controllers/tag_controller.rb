class TagController < ApplicationController

  def index
    @tags = Tag.all.to_a
  end

  def new
    @tag = Tag.new
  end

  def show
    
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:success] = "Successfully created new tag"
      redirect_to tags_index_path
    else
      flash[:error] = @tag.errors.full_messages.join(',')
      render action: :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    Tag.find(params[:id]).update(tag_params)
    redirect_to tags_index_path
  end

  def destroy
    Tag.find(params[:id]).destroy
    redirect_to tags_index_path
  end



  private

  def tag_params
    params.require(:tag).permit(:name,:slug)
  end

  # new / create / edit / update /destroy
end
