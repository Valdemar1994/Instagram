require 'rails_helper'

RSpec.describe FollowsController, type: :controller do
  let(:user) { create :user }
  let(:user_you_want_to_follow) { create :user }

  before { sign_in user }

  describe "#create" do
    subject { process :create, method: :post, params: { user_id: user_you_want_to_follow.id } }

    context 'when there is a first follow' do

      it 'follows otheruser' do
        expect { subject }.to change(Follow, :count).by(1)
        expect(user.following.last.followed_id).to eq user_you_want_to_follow.id
      end
    end

    context 'when user tries to follow twice' do
    
      it 'doesnt follow other user twice' do
        Follow.create(follower_id: user.id, followed_id: user_you_want_to_follow.id)
        expect { subject }.not_to change(Follow, :count)
        expect(flash[:alert]).to match("Error! You connot follow twice")
      end
    end
  end

  describe "#destroy" do
    before { Follow.create(follower_id: user.id, followed_id: user_you_want_to_follow.id) }
    subject { process :destroy, method: :delete, params: { user_id: user.id, id: Follow.last.id } }

    it 'unfollows other user' do
      expect { subject }.to change(Follow, :count).by(-1)
    end
  end

  describe '#index' do
    subject { process :index, params: { user_id: user.id } }
       
    it 'render index template' do
      subject
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    subject { process :show, method: :get, params: { user_id: user.id, id: user_you_want_to_follow.id } }
       
    it 'render index template' do
      subject
      Follow.create(follower_id: user.id, followed_id: user_you_want_to_follow.id)
      expect(response).to render_template :show
    end
  end
end