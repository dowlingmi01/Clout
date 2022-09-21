class SurveyReward < ApplicationRecord
  belongs_to :survey 
  belongs_to :user 
  has_many :rewards_cashes, dependent: :destroy
  has_many :experiences, dependent: :destroy
  validates :survey_id, :user_id, presence: true
end
