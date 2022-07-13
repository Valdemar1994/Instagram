class HomeController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @posts = pagy(Post.eager_load([user: :avatar_attachment], :likes, [comments: :user], [image_attachment: :blob]).order(created_at: :desc))
  end
end
