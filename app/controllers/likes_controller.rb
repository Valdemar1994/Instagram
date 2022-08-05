class LikesController < ApplicationController
  before_action :find_post

  def create
    if Like.find_by(user_id: current_user.id, post_id: @post.id).blank?
      Like.create(user_id: current_user.id, post_id: @post.id)
    end
    return_to_prev_location
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    like.destroy if like
    return_to_prev_location
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
