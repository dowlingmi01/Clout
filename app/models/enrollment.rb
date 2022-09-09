class Enrollment < ApplicationRecord

  enum :status, { inactive: 0, in_process: 10, completed_full: 20, completed_disqualified: 30, terminated: 40 }

  belongs_to :survey
  belongs_to :user

  validates :user, :survey, presence: true

  validates_uniqueness_of :user_id, scope: :survey_id #user can't be enrolled in a survey more than once
  validates_uniqueness_of :survey_id, scope: :user_id #user can't be enrolled in a survey more than once

  def to_s
    user.to_s + survey.to_s
  end


end
