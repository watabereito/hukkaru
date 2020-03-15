class Recruit < ApplicationRecord
  validates :title, presence: true
  validates :team_id, presence: true
  validates :Capacity, presence: true
  validates :body, presence: true
end
