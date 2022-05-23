class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true
  has_many :user_parties
  has_many :parties, through: :user_parties
  has_secure_password
end
