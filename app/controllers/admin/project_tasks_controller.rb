class Admin::ProjectTasksController < Admin::AdminController
	before_action :set_project

	def index
		if params[:group].present?
			@group = Group.find(params[:group])
			@tasks = @group.tasks.order(:stage_id).order(:num)
		else
			@tasks = @project.tasks.order(:stage_id).order(:num)
		end
	end

	def create
		@task = Task.new(task_params)
		@stage = Stage.find(params[:task][:stage_id])

		if @task.save
			redirect_to admin_project_stage_path(@project, @stage), notice: "#{@project.name} 第#{@stage.num}週 #{@stage.name} － 第#{@task.num}項作業「#{@task.name}」新增成功！"
		else
			render 'admin/project_stages/show'
		end
	end

	def update
		@stage = Stage.find(params[:task][:stage_id])
		@task = Task.find(params[:id])
		if @task.update(task_params)
			redirect_to admin_project_stage_path(@project, @stage), notice:  "#{@project.name} 第#{@stage.num}週 #{@stage.name} － 第#{@task.num}項作業「#{@task.name}」編輯成功！"
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
		params.require(:task).permit(:name, :num, :info, :stage_id, :team_work, :published_at, :deadline)
	end
end
