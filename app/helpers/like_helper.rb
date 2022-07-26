module LikeHelper
    def has_like?(post, current_user)
        Like.find_by(post_id: post.id, user_id: current_user.id)
    end
end