class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = 'Succes! New post created!'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Error! New post not created!'
      return_to_prev_location
    end
  end

  def show
    if params[:id]
      @post ||= Post.find(params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
end
