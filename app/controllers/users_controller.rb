class UsersController < ApplicationController
  include Pagy::Backend

  def index
    @users ||= User.all
  end

  def show
    @user ||= User.eager_load(:followers, :posts, [posts: :image_attachment]).find(params[:id])
    @follow = @user.followers.find_by(follower: current_user)
    @pagy, @posts = pagy(@user.posts.order(created_at: :desc), items: 9)
  end

  def edit
    @user = User.find(params[:id])
    if !UserPolicy.new(@user, current_user).edit?
      flash[:alert] = 'Error! You can update only yours account'
      redirect_to @user
    end
  end

  def update
    @user = User.find(user_params[:id])
    if UserPolicy.new(@user, current_user).update?
      @user.update(user_params)
      redirect_to current_user
    else
      flash[:alert] = 'Error! You can update only yours account'
      return_to_prev_location
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :username, :name, :avatar)
  end
end
