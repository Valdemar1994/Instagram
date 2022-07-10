require 'rails_helper'

RSpec.describe 'Posts', :js, type: :feature do
# describe "create new post", type: :feature do
  let(:user) { create :user }
  before { sign_in user }

  scenario 'type and create new post' do
    visit new_post_path
      fill_in 'description', with: description { FFaker::Lorem.sentence }
      fill_in 'image', with: 
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/assets/test-image.jpg')) }
    click_button 'Create Post'
    expect(page).to post_path(@post)
    end
#   end
end