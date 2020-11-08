class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :liked_candidates
  has_many :disliked_candidates
end
