class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      return_to_prev_location
    else
      flash[:alert] = 'Comment was not created!'
      return_to_prev_location
    end
  end

  def destroy
    @comment = Comment.find((params[:id]))
    if CommentPolicy.new(@comment, current_user).delete?
      @comment.destroy
      return_to_prev_location
    else
       flash[:alert] = 'Comment was not deleted!'
       return_to_prev_location
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :user_id)
  end
end
