require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it 'is valid' do
    is_expected.to be_valid
  end

  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:comments) }
  it { is_expected.to have_many(:likes) }

  it { is_expected.to have_many(:followers).with_foreign_key(:followed_id).class_name('Follow') }
  it { is_expected.to have_many(:following).with_foreign_key(:follower_id).class_name('Follow') }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:username) }

  it { is_expected.to have_one_attached(:avatar) }
end
