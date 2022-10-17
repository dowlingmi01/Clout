class CompletionsController < ApplicationController
	before_action :set_survey
	before_action :authenticate_user!
	skip_after_action :verify_authorized

	def create
		@completion = @survey.completions.where(completer: current_user).first_or_create
		@rewards_cashes = @survey.rewards_cashes.where(user_id: current_user.id, survey_id: @survey.id, rewards_cash_amount: @survey.rewards_cash).first_or_create
		@experiences = @survey.experiences.where(user_id: current_user.id, survey_id: @survey.id, experience_amount: @survey.experience).first_or_create
		@survey_rewards = @survey.survey_rewards.where(user_id: current_user.id, survey_id: @survey.id, survey_reward_amount: @survey.survey_reward).first_or_create

		if @completion.save ||= @rewards_cashes.save ||= @experiences.save ||= @survey_rewards.save
			flash[:notice] = "You have completed the survey, you earned: #{@rewards_cashes.rewards_cash_amount} CloutCash, #{@experiences.experience_amount} CloutXP and #{@survey_rewards.survey_reward_amount} Clout Currency"  
			redirect_to surveys_path
		end
	end

	private

	def set_survey
		@survey = Survey.find(params[:survey_id])
	end

end
