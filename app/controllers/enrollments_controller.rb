class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  skip_after_action :verify_authorized

  def index
    @enrollments = Enrollment.all
    @surveys = Survey.all
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def edit
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @enrollment.update(enrollment_params)
        format.html { redirect_to enrollment_url(@enrollment), notice: "Enrollment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @enrollment.destroy

    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: "Enrollment was successfully destroyed." }
    end
  end

  private
    
    def set_enrollment
      @enrollment = Enrollment.find(params[:id])
    end
    
    def enrollment_params
      params.require(:enrollment).permit(:survey_id, :user_id, :status)
    end
end
