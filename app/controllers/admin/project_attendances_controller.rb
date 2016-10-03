class Admin::ProjectAttendancesController < Admin::AdminController
	before_action :set_project

	def index
		@stages = @project.stages.order(:num)
		@groups = @project.groups
	end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end
end
