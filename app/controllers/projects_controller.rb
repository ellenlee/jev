class ProjectsController < ApplicationController
	before_action :check_participant?, except: :index
	before_action :set_project, except: :index

	def index
		@projects = Project.where(status_id: 1 ).all
	end

	def show
		@stages = @project.stages.order(:num)
	end


	private
	def set_project
		@project = Project.find(params[:id])
	end

	def check_participant?
		set_project
		redirect_to root_path, :notice =>"您尚未參加本專案，請洽工作團隊完成專案登錄（TEL: 09XX-XXX-XXX）" unless current_user.participations.where(project: @project, status_id: 1).exists? 
	end

end
