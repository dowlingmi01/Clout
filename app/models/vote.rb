class Vote < ApplicationRecord
  belongs_to :user
  validates :vote_options, presence: true
  has_and_belongs_to_many :vote_options
end
