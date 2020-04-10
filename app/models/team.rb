class Team < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :age, numericality: true
  validates :member, presence: true
  validates :member, numericality: true
  validates :discription, presence: true
  validates :message, presence: true
  mount_uploader :photo, PhotoUploader

def self.search(search)
  if search
    Team.where(['name LIKE ?', "%#{search}%"])
  else
    Team.all
  end
end

  has_many :recruits
  has_many :user_teams
  belongs_to :user
end
