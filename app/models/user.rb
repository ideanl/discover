class User < ActiveRecord::Base
	has_many :posts, dependent: :destroy
	has_many :movies
	has_one :profile
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :email, :fname, :lname, presence: true
  validates :username, :fname, :lname, :email, length: { maximum: 50 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :username, :email, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
