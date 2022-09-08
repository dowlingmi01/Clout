class CompletionsController < ApplicationController
	before_action :set_survey, only: [:create]
	before_action :authenticate_user!

	def create
		@completion = @survey.completions.where(completer: current_user).first_or_create

		if @completion.save
			flash[:notice] = "You have completed the survey"
			redirect_to user_path(current_user)			
		end
	end

  private

    def set_survey
      @survey = Survey.find(params[:survey_id])
    end

end
