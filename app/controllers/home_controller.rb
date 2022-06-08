class HomeController < ApplicationController
  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc))
  end
end
