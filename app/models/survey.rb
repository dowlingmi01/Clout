class Survey < ApplicationRecord
	belongs_to :organizer, class_name: "User", foreign_key: "user_id"
	has_many :completions, dependent: :destroy
	has_many :completers, through: :completions

	validates :survey_name, presence: true, length: {minimum: 5}
end
