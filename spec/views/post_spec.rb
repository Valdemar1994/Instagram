require 'rails_helper'

RSpec.describe 'Posts', :js, type: :feature do
  let(:user) { create :user }
  let(:post) { create :post, :with_image, user_id: user.id }

describe "post", type: :feature do
  scenario 'type and create new post' do
    sign_in(user)
    visit new_post_path
      fill_in new_post_path['desription'], with: FFaker::Lorem.sentence 
      attach_file(new_post_path["Выберите файл"], Rails.root + "spec/support/assets/test-image.jpg")
    click_button 'Create Post'
    expect(page).to have_current_path(post_path(Post.first))
    end

    scenario 'update post' do
      sign_in(user)
      visit edit_post_path(post)
        fill_in edit_post_path(post)['desription'], with: 'New description'
      click_button 'Submit'
      expect(post.reload.description).to eq 'New description'
    end

    scenario 'delete post' do
      sign_in(user)
      visit edit_post_path(post)
      click_link 'Delete Post'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_current_path(root_path)
    end
  end
end