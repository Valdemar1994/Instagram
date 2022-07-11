require 'rails_helper'

RSpec.describe 'Follows', :js, type: :feature do
  let(:user) { create :user }
  let(:other_user) { create :user }

describe "follow", type: :feature do
  scenario 'you follow and destroy follow other user' do
    sign_in(user)
    visit user_path(other_user)
    click_link 'Follow'
    expect(page).to have_content "Followers : 1"
    expect(page).to have_current_path(user_path(other_user))
    visit user_path(user)
    expect(page).to have_content "Following : 1"
    expect(page).to have_current_path(user_path(user))
    visit user_path(other_user)
    click_link 'Unfollow'
    expect(page).to have_content "Followers : 0"
    expect(page).to have_current_path(user_path(other_user))
    visit user_path(user)
    expect(page).to have_content "Following : 0"
    expect(page).to have_current_path(user_path(user))
    end
  end
end