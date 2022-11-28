class CompletionsController < ApplicationController
	before_action :authenticate_user!
	skip_after_action :verify_authorized
	skip_before_action :verify_authenticity_token

	def create
		if params[:poll_id]
			@poll = Poll.find(params[:poll_id])
			@poll_completion = Completion.create(user_id: current_user.id, completion_source: @poll)
			@rewards_cash = RewardsCash.create(user_id: current_user.id, rewards_cash_amount: @poll.rewards_cash, rewards_cash_source: @poll)
			@experience = Experience.create(user_id: current_user.id, experience_amount: @poll.experience, experience_source: @poll)
			if @poll_completion.save ||= @rewards_cash.save ||= @experience.save
				flash[:notice] = "You have completed the poll, you earned: #{@rewards_cash.rewards_cash_amount} CloutCash and #{@experience.experience_amount} CloutXP"  
				redirect_to surveys_path
			end
		else params[:survey_id]
			@survey = Survey.find(params[:survey_id])
			@survey_completion = Completion.create(user_id: current_user.id, completion_source: @survey)
			@rewards_cashes = RewardsCash.create(user_id: current_user.id, rewards_cash_amount: @survey.rewards_cash, rewards_cash_source: @survey)
			@experiences = Experience.create(user_id: current_user.id, experience_amount: @survey.experience, experience_source: @survey)
			@survey_rewards = SurveyReward.create(user_id: current_user.id, survey_reward_amount: @survey.survey_reward, survey_reward_source: @survey)

			if @survey_completion.save ||= @rewards_cashes.save ||= @experiences.save ||= @survey_rewards.save
				flash[:notice] = "You have completed the survey, you earned: #{@rewards_cashes.rewards_cash_amount} CloutCash, #{@experiences.experience_amount} CloutXP and #{@survey_rewards.survey_reward_amount} Clout Currency"  
				redirect_to surveys_path
			end
	end
end
end
