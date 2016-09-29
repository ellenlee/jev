class Admin::ProjectAssignmentsController < Admin::AdminController
	before_action :set_project
	def create
		@assign = Assignment.new(assignment_params)
		
	end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end
	
	def assignment_params
		params.require(:assignment).permit(:stage_id, :task_id, :groupd_id, :deadline, :assigned_at, :team_work)
	end
end
