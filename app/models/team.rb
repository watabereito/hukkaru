class Team < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :discription, presence: true
  validates :message, presence: true

  belongs_to :user
end
