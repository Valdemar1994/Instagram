require 'rails_helper'

RSpec.describe 'Comments', :js, type: :feature do
  let(:user) { create :user }
  let(:post) { create :post, :with_image, user_id: user.id }

  describe "create comment", type: :feature do
    scenario 'type and create new comment' do
      sign_in(user)
      visit post_path(post)
      fill_in post_path(post)['comment'], with: FFaker::Lorem.sentence 
      click_button 'Add'
      expect(page).to have_current_path(post_path(post))
    end

    scenario 'type wrong comment' do
      sign_in(user)
      visit post_path(post)
      fill_in post_path(post)['comment'], with: ''
      click_button 'Add'
      expect(page).to have_current_path(post_path(post))
      expect(page).to have_content "Comment was not created"
    end
  end

  describe "destroy comment", type: :feature do
    scenario 'delete comment' do
      sign_in(user)
      visit post_path(post)
      fill_in post_path(post)['comment'], with: FFaker::Lorem.sentence 
      click_button 'Add'
      expect(page).to have_current_path(post_path(post))
      click_link '.'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_current_path(post_path(post))
    end
  end
end