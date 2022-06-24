require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:post) }

  it { is_expected.to validate_length_of(:comment).is_at_most(100) }

  it { is_expected.to validate_presence_of(:comment) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:post_id) }
end