class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :set_user
  skip_after_action :verify_authorized
  before_action :find_current_user_profile, only: [:edit, :update, :destroy]


  def index
    @profile = current_user.profile
    @surveys = current_user.completed_surveys
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = @user.build_profile(profile_params)
    respond_to do |format|
      if @profile.save
        format.html { redirect_to profiles_url, notice: "Profile was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profiles_url, notice: "Profile was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:user_id, :age, :gender, :ethnicity, :country)
    end
    
    def find_current_user_profile
      @profile = current_user.profile
      unless @profile 
        return redirect_to profiles_path
      end
    end

    def set_user
      @user = current_user
    end

end
