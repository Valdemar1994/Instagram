class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

    def create
    @post = Post.create(post_params)
    redirect_to root_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
  params.require(:post).permit(:description, :image, :user_id)
    end

end
