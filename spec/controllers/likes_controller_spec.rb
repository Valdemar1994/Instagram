require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { create :user }
  let(:post) { create :post, :with_image }

  before { sign_in user }

  describe "#create" do
    subject { process :create, method: :post, params: { post_id: post.id } }

    it 'likes post' do
      expect { subject }.to change(Like, :count).by(1)
    end
  end

  describe "#destroy" do
    subject { process :destroy, method: :delete, params: { id: Like.last.id, post_id: post.id } }
    
    it 'unlikes post' do
      Like.create(user_id: user.id, post_id: post.id)
      expect { subject }.to change(Like, :count).by(-1)
    end
  end
end
