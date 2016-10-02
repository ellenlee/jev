class Admin::ProjectTasksController < Admin::AdminController
	before_action :set_project

	def index
		@tasks = @project.tasks.order(:num)
		@stages = @project.stages.order(:num)
		@groups = @project.groups
		
		if params[:task].present?
			@task = Task.find(params[:task])
		else
			@task = Task.new
		end

		if params[:assign].present?
			@assignment = Assignment.find(params[:assign])
		else
			@assignment = Assignment.new(assigned_at: DateTime.now.to_date, deadline: DateTime.now.to_date)
		end

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
			redirect_to admin_project_tasks_path(@project), notice: "#{@project.name}｜工作項目 #{@task.num}「#{@task.name}」新增成功！"
		else
			redirect_to admin_project_tasks_path(@project), alert: "#{@task.errors.full_messages.to_sentence}"
		end
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			redirect_to admin_project_tasks_path(@project), notice:  "#{@project.name}｜工作項目 #{@task.num}「#{@task.name}」編輯成功！"
		else
			render 'admin/project_stages/show'
		end
	end

	def destroy
		@task = Task.find(params[:id])
		# if @task.published_at != nil && @task.published_at.past?
			# redirect_to admin_project_stage_path(@project, params[:stage_id]), alert: "發佈時間已過，不可刪除！"
		# else
		if @task.destroy
			redirect_to admin_project_tasks_path(@project), alert: "您已刪除 工作項目 ##{@task.num}「#{@task.name}」"
		else
			redirect_to admin_project_tasks_path(@project), alert: "#{@task.errors.full_messages.to_sentence}"
		end
			
			
		# end
	end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end
	
	def task_params
		params.require(:task).permit(:project_id, :name, :num, :team_work)
	end
end
