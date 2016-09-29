class Admin::ProjectTasksController < Admin::AdminController
	before_action :set_project

	def index
		@tasks = @project.tasks.order(:num)
		@groups = @project.groups
		@task = Task.new
		@assignment = Assignment.new
		# if params[:group].present?
		# 	@group = Group.find(params[:group])
		# 	@tasks = @project.tasks.order(:num)
		# else
			# @tasks = @project.tasks.order(:num)
		# end
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to admin_project_tasks_path(@project), notice: "#{@project.name} － 工作項目 #{@task.num}「#{@task.name}」新增成功！"
		else
			render 'admin/project_tasks/index'
		end
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			redirect_to admin_project_stage_path(@project, @stage), notice:  "#{@project.name} － 工作項目 #{@task.num}「#{@task.name}」編輯成功！"
		else
			render 'admin/project_stages/show'
		end
	end

	def destroy
		@task = Task.find(params[:id])
		# if @task.published_at != nil && @task.published_at.past?
			# redirect_to admin_project_stage_path(@project, params[:stage_id]), alert: "發佈時間已過，不可刪除！"
		# else
			@task.destroy
			redirect_to admin_project_stage_path(@project, params[:stage_id]), alert: "您已刪除 第#{@task.num}項作業「#{@task.name}」："
		# end
	end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end
	
	def task_params
		params.require(:task).permit(:project_id, :name, :num, :team_work, :group_ids => [])
	end
end
