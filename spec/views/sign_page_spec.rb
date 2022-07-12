require 'rails_helper'

RSpec.describe 'User', :js, type: :feature do
  let(:user) { create :user }

  describe 'registration' do
    scenario 'success sign up' do
      visit new_user_registration_path
      expect(page).to have_content 'Sign up'
        fill_in 'Email', with: FFaker::Internet.email
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        fill_in 'Username', with: FFaker::Internet.user_name
        fill_in 'Name', with: FFaker::Name.name
      click_button 'Sign up'
      expect(page).to have_current_path(root_path)
    end
  end

  describe "the log in/out process", type: :feature do
    before :each do
      User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password',
      username: 'Vadim', name: 'Valdemar')
    end

    scenario 'success log in' do
      visit user_session_path
      expect(page).to have_content 'Log in'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end

    scenario 'fail log in' do
      visit user_session_path
      expect(page).to have_content 'Log in'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'incorrect_password'
      click_button 'Log in'
      expect(page).to have_current_path(user_session_path)
    end

    scenario 'log out' do
      sign_in(user)
      find("a[href='#{destroy_user_session_path}']").click
      expect(page).to have_current_path(user_session_path)
    end
  end
end