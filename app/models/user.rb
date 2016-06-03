class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :alias, presence: :true
  validates :email, confirmation: :true, presence: :true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, :length => {:minimum => 8 }
end
