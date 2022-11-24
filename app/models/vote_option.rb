class VoteOption < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :votes
  has_many :users, through: :votes
  validates :title, presence: true
end
