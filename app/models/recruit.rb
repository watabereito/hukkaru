class Recruit < ApplicationRecord
  validates :title, presence: true
  validates :Capacity, presence: true
  validates :body, presence: true

  has_many :recruit_comments
end
