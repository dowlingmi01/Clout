class Admin::UsersController < Admin::ApplicationController

	def index
		@users = User.order(:email)
	end

	def show
		@user = User.find(params[:id])
	end

end
