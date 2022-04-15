class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @spot = @comment.spot
    if @comment.save
      redirect_to spot_path(@spot)
    else
      render "spots/show"
    end
  end

  def edit
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:spot_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to spot_path(@comment.spot)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      flash[:delete_alert] = "コメントを削除しました"
      redirect_to spot_path(@comment.spot)
    else
      render "spots/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :comment_image).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end
end
