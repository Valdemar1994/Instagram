class UsersController < ApplicationController
  include Pagy::Backend

  def index
    @users = User.all
  end

  def show
    @user ||= User.eager_load(:followers, :posts).find(params[:id])
    @follow = @user.followers.find_by(follower: current_user)
    @pagy, @posts = pagy(@user.posts.order(created_at: :desc), items: 9)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
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
    params.require(:user).permit(:username, :name, :avatar)
  end
end
