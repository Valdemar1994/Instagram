require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create :user }
  before { sign_in user }

  describe '#create' do
    subject { process :create, method: :post, params: params }

    context 'when params is valid' do
      let(:params) { { post: attributes_for(:post, :with_image, user_id: user.id) } }

      it 'creates a post' do
        expect { subject }.to change(Post, :count).by(1)
      end

      it 'redirect to post path' do
        subject
        expect(response).to redirect_to post_path(Post.last)
      end

      it 'assigns post to current user' do
        subject
        expect(assigns(:post).user).to eq user
      end
    end

    context 'when params is invalid' do
      let(:params) { { post: attributes_for(:post) } }

      it 'doesnt create a post' do
        expect { subject }.not_to change(Post, :count)
      end
    end

    context 'when post to long' do
      let(:params) { { post: attributes_for(:post, :with_long_post, user_id: user.id) } }
                    
      it 'doesnt create a comment' do
        expect { subject }.not_to change(Post, :count)
      end
    end
  end

  describe '#new' do
    subject { process :new }

    it 'assigns @post' do
      subject
      expect(assigns(:post)).to be_a_new Post
    end

    it 'renders the new template' do
      subject
      expect(response).to render_template :new
    end
  end

  describe '#show' do
    let(:params) { { user_id: user.id, id: post } }
    subject { get :show, params: params }

    let!(:post) { create :post, :with_image }

    it 'assigns @post' do
      subject
      expect(assigns(:post)).to eq(post)
    end

    it { is_expected.to render_template(:show) }
  end
end
