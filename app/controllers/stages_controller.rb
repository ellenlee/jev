class StagesController < ApplicationController
	before_action :check_participation


	def index
		set_project
		@stages = @project.stages
		@stage = @stages.first
		@upload = Upload.new
	end

	def show
		
	end


	private

	def set_project
		@project = Project.find_by_id(params[:project_id])	
	end

	def check_participation
		set_project
		if @project.users.include?(current_user)
			return
		else
			redirect_to new_user_participant_path(current_user, project: params[:project_id])
			flash[:alert] = "請先完成登錄程序！"
		end	
	end



end
