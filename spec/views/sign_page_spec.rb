require 'rails_helper'

RSpec.describe 'User', :js, type: :feature do
# describe "the signin process", type: :feature do
  let(:user) { build(:user) }
  scenario 'success sign up' do
    visit new_user_registration_path
    expect(page).to have_content 'Sign up'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation 
      fill_in 'Username', with: user.username
      fill_in 'Name', with: user.name
    click_button 'Sign up'
    expect(page).to have_current_path(root_path)
  end
end
# end

RSpec.describe 'User', :js, type: :feature do
  # describe "the signin process", type: :feature do
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
  # end
end
