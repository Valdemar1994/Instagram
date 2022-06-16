class FollowsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
    end
    
    def show
        @user = User.eager_load(:followers).find(params[:user_id])
        followers_ids = @user.followers.pluck(:follower_id)
        @followers = User.find(followers_ids)
    end

    def create
        other_user = User.find(params[:user_id])
        @follow = Follow.new(follower_id: current_user.id,
                           followed_id: other_user.id)
        if @follow.save
            return_to_prev_location
        else
            flash[:alert] = "Error! Your is not follow"
            return_to_prev_location
        end
    end

    def destroy
        @follow = Follow.find(params[:id])
        @follow.destroy
        return_to_prev_location
    end
end
