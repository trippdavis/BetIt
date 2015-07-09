class TagsController < ApplicationController
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render :json => @tag
    else
      render :json => @tag.errors.full_messages
    end
  end

  def show
    @tag = Tag.find(params[:id])
    render :json => @tag
  end

  def index
    @tags = Tag.all
    render :json => @tags
  end

  private
  def tag_params
    params.require(:tag).permit(:title)
  end
end
