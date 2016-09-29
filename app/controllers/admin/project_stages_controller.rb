class Admin::ProjectStagesController < Admin::AdminController
	before_action :set_project
	before_action :set_stage, only: [:show, :edit, :update, :destroy]

	def index
		@groups = @project.groups
		@stages = @project.stages.order(:num)

		if params[:lesson].present?
			@lesson = Lesson.find(params[:lesson])
		else
			@lesson = Lesson.new(published_at: DateTime.now.to_date)
		end

		if params[:stage].present?
			@stage = Stage.find(params[:stage])
		else
			@stage = Stage.new
		end
	end

	def new
		@stage = @project.stages.build(published_at: DateTime.now.to_date)
	end

	def create
		@stage = @project.stages.build(stage_params)

		if @stage.save
			redirect_to admin_project_stages_path(@project), notice: "#{@project.name} 工作階段 第#{@stage.num}週  新增成功！"
		else
			render :action => :new
		end
	end

	def show
		@group = @stage.group
		@tasks = @stage.tasks.order(:num)
		if params[:task]
			@task = Task.find(params[:task])
		else 
			# @task = Task.new(published_at: DateTime.now.to_date, deadline: DateTime.now.to_date)
		end
	end

	def edit
	end

	def update
		if @stage.update(stage_params)
			redirect_to admin_project_stages_path(@project), notice: "#{@project.name} 工作階段 第#{@stage.num}週 編輯成功！"
		else
			render :action => :edit
		end
	end

	def destroy
		if @stage.destroy
			redirect_to admin_project_stages_path(@project), alert: "您已刪除 #{@project.name} 第#{@stage.num}週 工作階段"
		else
			redirect_to admin_project_stages_path(@project), alert: "#{@stage.errors.full_messages.to_sentence}"
		end
	end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_stage
		@stage = Stage.find(params[:id])
	end
	
	def stage_params
		params.require(:stage).permit(:num, :project_id)
	end
end
