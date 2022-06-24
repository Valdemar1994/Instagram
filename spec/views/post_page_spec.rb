require 'rails_helper'

RSpec.describe 'Home page', :js, type: :feature do
  let!(:user) { create :user }

  scenario 'user creates post' do
    login_as(user)
  end
end
