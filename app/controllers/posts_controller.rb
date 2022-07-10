class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:notice] = 'Succes! New post is created!'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Error! New post is not created!'
      redirect_to new_post_path
    end
  end

  def show
    if params[:id]
      @post ||= Post.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    @post ||= Post.find(params[:id])
  end

  def update

    @post ||= Post.find(post_params[:id])
    if PostPolicy.new(@post, current_user).update?
      @post.update(post_params)
      flash[:notice] = 'Your post updated!'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Error! Post can not be updated'
      return_to_prev_location
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if PostPolicy.new(@post, current_user).delete?
      @post.destroy
      flash[:alert] = 'Your post deleted!'
      redirect_to root_path
    else
      flash[:alert] = 'Error! Post can not been deleted'
      return_to_prev_location
    end
  end

  private

  def post_params
    params.require(:post).permit(:id, :description, :image, :user_id)
  end
end