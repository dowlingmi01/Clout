class ApplicationController < ActionController::Base

	include Pundit

	after_action :verify_authorized, unless: :devise_controller?
	before_action :configure_permitted_parameters, if: :devise_controller?
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized



	private

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
	end

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform that function"
		redirect_to(request.referrer || root_path)
	end
end
