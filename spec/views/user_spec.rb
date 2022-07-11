require 'rails_helper'

RSpec.describe 'Users', :js, type: :feature do
  let(:user) { create :user }

  describe "user", type: :feature do
    scenario '' do
      sign_in(user)
      visit new_post_path
      fill_in new_post_path['desription'], with: FFaker::Lorem.sentence 
      attach_file(new_post_path["Выберите файл"], Rails.root + "spec/support/assets/test-image.jpg")
      click_button 'Create Post'
      expect(page).to have_current_path(post_path(Post.first))
    end
  end
end