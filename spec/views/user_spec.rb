require 'rails_helper'

RSpec.describe 'Users', :js, type: :feature do
  let(:user) { create :user }

  describe "user", type: :feature do
    scenario 'Show user page' do
      sign_in(user)
      find("a[href='#{user_path(user)}']").click
      expect(page).to have_current_path(user_path(user))
    end

    scenario 'Edit user page' do
      sign_in(user)
      find("a[href='#{user_path(user)}']").click
      click_button 'Edit Profile'
      fill_in ['name'], with: 'Test'
      click_button 'Submit'
      expect(page).to have_current_path(user_path(user))
    end
  end
end