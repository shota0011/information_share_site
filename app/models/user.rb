class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :documents, dependent: :nullify
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_documents, through: :likes, source: :document

  def already_liked?(document)
    self.likes.exists?(document_id: document.id)
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
    user.password = SecureRandom.urlsafe_base64
    end
  end
end
