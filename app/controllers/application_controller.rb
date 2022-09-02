class ApplicationController < ActionController::Base

	include Pundit
	include DeviseWhitelist
	include SetSource
	include CurrentUserConcern
	include DefaultPageContent

	after_action :verify_authorized, unless: :devise_controller?
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	before_action :set_copyright

	def set_copyright
		@copyright = CloutViewTool::Renderer.copyright 'CloutCloud', 'All rights reserved'
	end

	private

	def user_not_authorized
		flash[:alert] = "You are not authorized to perform that function"
		redirect_to(request.referrer || root_path)
	end
end

module CloutViewTool
	class Renderer
		def self.copyright name, msg
			"&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
		end
	end
end
