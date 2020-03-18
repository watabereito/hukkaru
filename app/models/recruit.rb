class Recruit < ApplicationRecord
  validates :title, presence: true
  validates :Capacity, presence: true
  validates :body, presence: true

  belongs_to :team
end
