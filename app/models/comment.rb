class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, length: { maximum: 100 }

  validates_presence_of :comment
  validates_presence_of :user_id
  validates_presence_of :post_id
end
