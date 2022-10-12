class Admin::SurveysController < Admin::ApplicationController
	before_action :set_survey, only: [:show, :edit, :update, :destroy]  
	before_action :authenticate_user!, except: [:index, :show]


	def index
		@surveys = Survey.order(:id)
	end
	
  def create
    @survey = Survey.new(survey_params)

    authorize @survey, :create?
    @survey.organizer = current_user

    respond_to do |format|
      if @survey.save
        format.html { redirect_to survey_url(@survey), notice: "Survey was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

	def edit
		
	end

	def update
		if @survey.update(survey_params)
			flash[:notice] = "Survey has been updated"
			redirect_to survey_url(@survey)
		else
			flash[:alert] = "Survey has not been updated"
			render "edit"
		end
	end

	def destroy
    	@survey.destroy

	    respond_to do |format|
	      format.html { redirect_to admin_surveys_path, notice: "Survey was successfully destroyed." }
	      format.json { head :no_content }
    end

	end

	private

    def survey_params
      params.require(:survey).permit(:survey_name, 
                                    :description, 
                                    :location,
                                    :start_date,
                                    :end_date,
                                    :cpi,
                                    :loi,
                                    :survey_id,
                                    :category_id,
                                    :experience,
                                    :rewards_cash,
                                    :survey_reward
                                    )
    end

	def set_survey
		@survey = Survey.find(params[:id])
	end
end
