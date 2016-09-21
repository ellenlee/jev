class Admin::ProjectsController < ApplicationController
	before_action :check_admin
	layout "admin"

	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		@users = @project.users
		@groups = @project.groups
		# Participant.where(project:1, user:1).first.group
		
	end

	private
	def check_admin
		redirect_to root_path, :notice =>"Oooops?!" unless current_user.admin?
	end	

end
