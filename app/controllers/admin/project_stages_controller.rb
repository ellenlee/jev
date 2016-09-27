class Admin::ProjectStagesController < Admin::AdminController
	before_action :set_project
	before_action :set_stage, only: [:show, :edit, :update, :destroy]

	def new
		@stage = @project.stages.build
	end

	def create
		@stage = @project.stages.build(stage_params)

		if @stage.save
			redirect_to admin_project_path(@project), notice: "#{@project.name} 第#{@stage.num}週 工作階段：「#{@stage.name}」新增成功！"
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
			@task = Task.new(published_at: DateTime.now.to_date, deadline: DateTime.now.to_date)
		end
	end

	def edit
	end

	def update
		if @stage.update(stage_params)
			redirect_to admin_project_path(@project), notice: "#{@project.name} 第#{@stage.num}週 工作階段：「#{@stage.name}」 編輯成功！"
		else
			render :action => :edit
		end
	end

	def destroy
		if @stage.published_at != nil && @stage.published_at.past?
			redirect_to admin_project_path(@project), alert: "發佈時間已過，不可刪除！"
		else
			@stage.destroy
			redirect_to admin_project_path(@project), alert: "您已刪除 #{@project.name} 第#{@stage.num}週 工作階段：「#{@stage.name}」"
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
		params.require(:stage).permit(:name, :num,:info, :project_id, :group_id, :published_at)
	end
end
