class FollowsController < ApplicationController
  def index
    @followings ||= User.find(params[:user_id]).following
  end

  def show
    user = User.find(params[:user_id])
    followers_ids = user.followers.pluck(:follower_id)
    @followers = User.find(followers_ids)
  end

  def create
    other_user = User.find(params[:user_id])
    @follow = Follow.new(follower_id: current_user.id,
                         followed_id: other_user.id) 
    if current_user.following.pluck(:followed_id).exclude?(params[:user_id].to_i)
      if @follow.save
        return_to_prev_location
      else
        flash[:alert] = "Something went wrong"
      end
    else
      flash[:alert] = "Error! You connot follow twice!"
      return_to_prev_location
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    return_to_prev_location
  end
end