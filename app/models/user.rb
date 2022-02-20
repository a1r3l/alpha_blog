class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :articles
  validates :username, :email, presence: true
  validates :username, :email, uniqueness: { case_sensitive: false }
  validates :username, length: { minimum: 3, maximum: 25 }
  validates :email, length: { maximum: 105 }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
end