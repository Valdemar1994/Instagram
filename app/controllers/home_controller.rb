class HomeController < ApplicationController
  include Pagy::Backend
  
  def index
    @pagy, @posts = pagy(Post.order(created_at: :desc))
  end
end
