class ApplicationController < ActionController::Base

	include Pundit
	include DeviseWhitelist
	include SetSource
	include CurrentUserConcern

	after_action :verify_authorized, unless: :devise_controller?
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform that function"
		redirect_to(request.referrer || root_path)
	end
end
