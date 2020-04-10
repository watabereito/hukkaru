class User < ApplicationRecord
  has_secure_password

  has_many :teams
  has_many :recruits, dependent: :destroy
  has_many :recruit_comments
  has_many :user_teams
end
