class Admin::ProjectAssignmentsController < Admin::AdminController
	before_action :check_blank, :set_config, except: [:destroy]
	before_action :set_project

	def create

		@assign = Assignment.new(assignment_params)
		@task = Task.find(params[:assignment][:task_id])
		@stage = @project.stages.find(params[:assignment][:stage_id])
		@group = @project.groups.find(params[:assignment][:group_id])
		if @assign.save 
			redirect_to admin_project_tasks_path(@project), notice: "#{@project.name} 第#{@stage.num}週 工作項目-#{@assign.num}-#{@task.name} 已指派給 #{@group.name}！"
		else
			redirect_to admin_project_tasks_path(@project), alert: "#{@assign.errors.full_messages.to_sentence}"
		end
	end

	def update
		@assign = Assignment.find(params[:id])
		if @assign.update (assignment_params)
			redirect_to admin_project_tasks_path(@project), notice: "#{@project.name} 第#{@stage.num}週 工作項目-#{@assign.num}-#{@task.name} 已指派給 #{@group.name}！"
		else
			redirect_to admin_project_tasks_path(@project), alert: "#{@assign.errors.full_messages.to_sentence}"
		end
	end

	def destroy
		@assign = Assignment.find(params[:id])
		if @assign.destroy
			redirect_to admin_project_tasks_path(@project), alert: "您已刪除 #{@assign.group.name} 第#{@assign.stage.num}週 工作項目 「#{@assign.task.name}」"
		else
			redirect_to admin_project_tasks_path(@project), alert: "#{@assign.errors.full_messages.to_sentence}"
		end
		
		
	end

	private
	def check_blank
		set_project
		if params[:assignment][:stage_id] == "" || params[:assignment][:task_id] == "" || params[:assignment][:group_id] == "" 
			redirect_to admin_project_tasks_path(@project), alert: "週次、班別、工作項目不能有空白哦！"
		end 
	end

	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_config
		@task = Task.find(params[:assignment][:task_id])
		@stage = @project.stages.find(params[:assignment][:stage_id])
		@group = @project.groups.find(params[:assignment][:group_id])
	end
	
	def assignment_params
		params.require(:assignment).permit(:stage_id, :task_id, :group_id, :deadline, :assigned_at, :num)
	end
end
