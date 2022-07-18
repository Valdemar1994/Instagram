require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create :user }
  let(:post) { create :post, :with_image }
  before { sign_in user }

  describe '#create' do
    subject { process :create, method: :post, params: params }

    context 'when params is valid' do
      let(:params) { { comment: attributes_for(:comment, post_id: post.id, user_id: user.id) } }
      it 'creates a comment' do
        expect { subject }.to change(Comment, :count).by(1)
      end

      it 'redirect to request referer path' do
        subject
        expect(response).to redirect_to request.referer || root_path
      end

      it 'assigns comment to current user' do
        subject
        expect(assigns(:comment).user).to eq user
      end

      it 'assigns comment to current post' do
        subject
        expect(assigns(:comment).post).to eq post
      end
    end

    context 'when params is invalid' do
      let(:params) { { comment: attributes_for(:comment) } }

      it 'doesnt create a comment' do
        expect { subject }.not_to change(Comment, :count)
      end
    end

    context 'when comment to long' do
      let(:params) { { comment: attributes_for(:comment, :with_long_comment, 
                                          post_id: post.id, user_id: user.id ) } }
                    
      it 'doesnt create a comment' do
        expect { subject }.not_to change(Comment, :count)
      end
    end
  end
end
