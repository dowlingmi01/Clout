class User < ApplicationRecord
  has_many :organized_surveys, class_name: "Survey", dependent: :destroy
  has_many :completions, dependent: :destroy
  has_many :completed_surveys, through: :completions
  has_many :enrollments
  has_many :rewards_cashes, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :survey_rewards, dependent: :destroy
  has_one :profile, dependent: :destroy
  validates :first_name, :last_name, :email, presence: true
  has_many :votes, dependent: :destroy
  has_many :vote_options, through: :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
  "#{username}"
  end
  
  def voted_for?(question)
    Rails.cache.fetch('user_' + id.to_s + '_voted_for_' + question.id.to_s) { vote_options.any? {|v| v.question == question } }
  end

  def full_name
  "#{first_name} #{last_name}"           
  end

  def enroll_survey(survey)
    self.enrollments.create(survey: survey)
  end

  def total_rewards_cash
  rewards_cashes.sum(:rewards_cash_amount)
  end

  def total_experience
  experiences.sum(:experience_amount)
  end

  def total_survey_reward
  survey_rewards.sum(:survey_reward_amount)
  end

end
