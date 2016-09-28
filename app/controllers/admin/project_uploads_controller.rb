class Admin::ProjectUploadsController < Admin::AdminController
	def index
		@project = Project.find(params[:project_id])
		@tasks = @project.tasks.order(:stage_id).order(:num)
		@uploads = @project.uploads
		@groups = @project.groups
	end
end
