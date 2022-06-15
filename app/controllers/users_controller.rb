class UsersController < ApplicationController
        def show
      @user = User.find(params[:id])
      @follow = @user.followers.find_by(follower: current_user)
      @pagy, @posts = pagy(@user.posts.order(created_at: :desc), items: 9)
    end
    
    def edit
      @user = User.find(params[:id])
    end
    
    def update
        current_user.update(user_params)
        redirect_to current_user
    end

      private
    def user_params
        params.require(:user).permit(:username, :name, :avatar)
    end
end