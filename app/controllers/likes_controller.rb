class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:alert] = 'You can not like more than once'
    else
      @post.likes.create(user_id: current_user.id)
    end
    return_to_prev_location
  end

  def destroy
    if !already_liked?
      flash[:alert] = 'Cannot unlike'
    else
      @like.destroy
    end
    return_to_prev_location
  end

  private

  def find_post
    @post ||= Post.find(params[:post_id])
  end

  def find_like
    @like ||= @post.likes.find(params[:id])
  end

  def already_liked?
    Like.eager_load(:user).where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
