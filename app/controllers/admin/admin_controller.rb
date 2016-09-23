class Admin::AdminController < ApplicationController
	before_action :check_admin
	layout "admin"

	private

	def check_admin
		redirect_to root_path, :notice =>"Oooops?!" unless current_user.admin?
	end	
end
