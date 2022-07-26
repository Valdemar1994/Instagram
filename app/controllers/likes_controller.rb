class LikesController < ApplicationController
  before_action :find_post

  def create
    if Like.where(user_id: current_user.id, post_id: @post.id).blank?
      Like.create(user_id: current_user.id, post_id: @post.id)
    end
    return_to_prev_location
  end

  def destroy
    Like.where(post_id: @post.id, user_id: current_user.id).destroy_all
    return_to_prev_location
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end
end
