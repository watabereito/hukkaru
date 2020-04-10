class RecruitComment < ApplicationRecord
  belongs_to :recruit
  belongs_to :user
  validates :body, presence: true
end
