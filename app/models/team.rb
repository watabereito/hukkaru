class Team < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :discription, presence: true
  validates :message, presence: true

  has_many :recruits
  belongs_to :user
end
