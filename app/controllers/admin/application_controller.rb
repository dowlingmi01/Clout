class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!
  skip_after_action :verify_authorized

  def index
    @users = User.all
    @polls = Poll.all
    @surveys = Survey.all
    @categories = Category.all
    @completions = Completion.all
    @enrollments = Enrollment.all
    @rewards_cashes = RewardsCash.sum(:rewards_cash_amount)
    @experiences = Experience.sum(:experience_amount)
  end

  private

  def authorize_admin!
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path, alert: "You must be an admin"
    end
  end
end
