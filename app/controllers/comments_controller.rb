class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment: comment_params[:comment], pick_id: comment_params[:pick_id], user_id: current_user.id)
    redirect_to "/picks/#{@comment.pick.id}"
  end

  private
  def comment_params
    params.permit(:comment, :pick_id)
  end
end
