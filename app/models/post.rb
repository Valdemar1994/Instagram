class Post < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image

  validate :image_presence
  validates :description, length: { maximum: 256 }

  private 
  
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end