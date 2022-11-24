class Survey < ApplicationRecord
	belongs_to :organizer, class_name: "User", foreign_key: "user_id"
	belongs_to :category
	has_many :completions, as: :completion_source
	has_many :enrollments, dependent: :destroy
  has_many :experiences, as: :experience_source
  has_many :rewards_cashes, as: :rewards_cash_source
  has_many :survey_rewards, as: :survey_reward_source	
	validates :survey_name, presence: true, length: {minimum: 5}
	validates :description, :start_date, :end_date, :cpi, :loi, :category, :survey_reward, :rewards_cash, :experience, presence: true

	def enrolled(user)
		self.enrollments.where(user_id: [user.id], survey_id: [self.id].empty?)
	end
end
