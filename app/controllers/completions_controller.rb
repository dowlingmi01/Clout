class CompletionsController < ApplicationController
	before_action :set_survey
	before_action :authenticate_user!
	skip_after_action :verify_authorized

	def create
		@completion = @survey.completions.where(completer: current_user).first_or_create
		@rewards_cash = @survey.rewards_cash.where(user_id: current_user.id, survey_id: @survey.id, rewards_cash_amount: @survey.cpi/2).first_or_create
		@experience = @survey.experiences.where(user_id: current_user.id, survey_id: @survey.id, experience_amount: 10).first_or_create

		if @completion.save ||= @rewards_cash.save ||= @experience.save
			flash[:notice] = "You have completed the survey, you earned: #{@rewards_cash.rewards_cash_amount} CloutCash and #{@experience.experience_amount} CloutXP"  
			redirect_to surveys_path(current_user)
		end
	end

	private

	def set_survey
		@survey = Survey.find(params[:survey_id])
	end
end
