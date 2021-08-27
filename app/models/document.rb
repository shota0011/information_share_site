class Document < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :nullify
  has_many :likes, dependent: :nullify
end
