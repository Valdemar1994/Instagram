require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in user }

  describe '#index' do
    subject { process :index, method: :get }

    it 'render index template' do
      subject
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    let(:params) { { id: user.id } }
    subject { process :show, method: :get, params: params }

    it 'render show template' do
      subject
      expect(response).to render_template :show
    end
  end

  describe '#edit' do
    let(:params) { { id: user.id } }
    subject { process :edit, method: :put, params: params }

    it 'render edit template' do
      subject
      expect(response).to render_template :edit
    end
  end

  describe '#update' do

    context 'when valid params' do
      let(:params) { { user: { id: user.id, username: 'NewName' }} }

      subject { process :update, method: :patch, params: params }

      it 'updates user parameters' do

        subject
        expect(user.reload.username).to eq 'NewName'
      end
    end

    context 'when try to update other user params' do
      let(:other_user) { create(:user) }
      let(:params) { { user: { id: other_user.id, username: 'NewName' }} }
  
      subject { process :update, method: :patch, params: params }
  
      it 'doesnt update other user parameters' do
  
        subject
        expect(other_user.reload.username).not_to eq 'NewName'
      end
    end
  end
end