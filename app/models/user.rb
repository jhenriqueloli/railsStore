class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :orders, dependent: :destroy
  validates :username , presence: true, length: {minimum:3, maximum:30}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email , presence:  true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX}
  has_secure_password
end
