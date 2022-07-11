require 'rails_helper'

RSpec.describe 'Likes', :js, type: :feature do
  let(:user) { create :user }
  let(:post) { create :post, :with_image, user_id: user.id }

describe "likes", type: :feature do
  scenario 'create like' do
    sign_in(user)
    visit post_path(post)
    click_link 'Like'
    expect(page).to have_content "1 Like"
    expect(page).to have_current_path(post_path(post))
    click_link 'Unlike'
    expect(page).to have_content "0 Likes"
    end
  end
end