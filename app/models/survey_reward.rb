class SurveyReward < ApplicationRecord
  belongs_to :survey_reward_source, polymorphic: true
  belongs_to :user 
end
