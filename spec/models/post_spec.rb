require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { build(:post, :with_image) }

  it 'is valid' do
    is_expected.to be_valid
  end

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:likes) }

  it { is_expected.to validate_length_of(:description).is_at_most(256) }

  it { is_expected.to have_one_attached(:image) }
end
