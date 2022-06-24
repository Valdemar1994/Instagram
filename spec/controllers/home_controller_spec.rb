require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create :user }
  before { sign_in user }

  describe '#index' do
    subject { process :index }
    let(:posts) { create_list(:post, 5) }

    it 'render index template' do
      subject
      expect(response).to render_template :index
    end

    context 'when user is not signed in' do
      before { sign_out user }
      it 'redirects to the sign in page' do
        subject
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
