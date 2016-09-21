class Admin::GroupsController < ApplicationController
	before_action :check_admin
	layout "admin"

	def index
		@groups = Group.all
		
	end


	private
	def check_admin
		redirect_to root_path, :notice =>"Oooops?!" unless current_user.admin?
	end	
end
