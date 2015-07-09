class TaggingsController < ApplicationController
  def create
    @tagging = Tagging.new(tagging_params)

    if @tagging.save
      render :json => @tagging
    else
      render :json => @tagging.errors.full_messages
    end
  end

  def destroy
    @tagging = Tagging.find(params[:id])
    @tagging.destroy
    render :json => @tagging
  end

  private
  def tagging_params
    params.require(:tagging).permit(:bet_id, :tag_id)
  end
end
