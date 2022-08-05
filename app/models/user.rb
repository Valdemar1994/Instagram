class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :followers, foreign_key: 'followed_id', class_name: 'Follow'
  has_many :following, foreign_key: 'follower_id', class_name: 'Follow'

  has_one_attached :avatar

  validates :name, :username, presence: true
end
