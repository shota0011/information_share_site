class Document < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end
end
