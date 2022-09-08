class Completion < ApplicationRecord
  belongs_to :completer, class_name: "User", foreign_key: "user_id"
  belongs_to :completed_survey, class_name: "Survey", foreign_key: "survey_id"
end
