class Survey < ApplicationRecord
	validates :survey_name, presence: true, length: {minimum: 5}
end
