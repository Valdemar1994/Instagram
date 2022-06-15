class FollowsController < ApplicationController
    def create
        other_user = User.find(params[:user_id])
        @follow = Follow.new(follower_id: current_user.id,
                           followed_id: other_user.id)
        @follow.save
        redirect_to user_path(other_user)
    
    end

    def destroy
        @follow = Follow.find(params[:id])
        @follow.destroy
        redirect_to user_path(@follow.followed_id)
    end

end
