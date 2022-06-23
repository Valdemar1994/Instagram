require 'rails_helper'

RSpec.describe 'Home page', :js, type: :feature do


scenario 'user creates post' do

binding.pry
visit new_post_url
end
end