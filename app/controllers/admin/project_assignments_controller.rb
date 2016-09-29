class Admin::ProjectAssignmentsController < Admin::AdminController
	before_action :set_project

	def create
		@assign = Assignment.new(assignment_params)
		@stage = Stage.find(params[:assignment][:stage_id])
		@group = Group.find(params[:assignment][:group_id])
		@task = Task.find(params[:assignment][:task_id])
		if @assign.save 
			redirect_to admin_project_tasks_path(@project), notice: "#{@project.name} 第#{@stage.num}週 工作項目-#{@task.num}-#{@task.name} 已指派給 #{@group.name}！"
		else
			redirect_to admin_project_tasks_path(@project), alert: "#{@assign.errors.full_messages.to_sentence}"
		end
	end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end
	
	def assignment_params
		params.require(:assignment).permit(:stage_id, :task_id, :deadline, :assigned_at, :group_id)
	end
end
