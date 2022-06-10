class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc))
    @comment = Comment.new
  end
end
