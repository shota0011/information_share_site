class Like < ApplicationRecord
  belongs_to :user
  belongs_to :document, counter_cache: :likes_count
  validates :user_id, uniqueness: {
    scope: :document_id,
    message: "は同じ投稿に2回以上いいねはできません"
  }
end
