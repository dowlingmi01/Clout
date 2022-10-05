class Survey < ApplicationRecord
	belongs_to :organizer, class_name: "User", foreign_key: "user_id"
	belongs_to :category
	has_many :completions, dependent: :destroy
	has_many :completers, through: :completions
	has_many :enrollments, dependent: :destroy
	has_many :survey_rewards
	has_many :rewards_cash, dependent: :destroy
	has_many :experiences, dependent: :destroy
	validates :survey_name, presence: true, length: {minimum: 5}
	validates :description, :start_date, :end_date, :cpi, :loi, :category, presence: true

	def enrolled(user)
		self.enrollments.where(user_id: [user.id], survey_id: [self.id].empty?)
	end
end
