class ProjectStagesController < ApplicationController
	before_action :set_project

	def show
		@stage = Stage.find(params[:id])
		@group = @stage.group
		@tasks = @stage.tasks.order(:num)
		# if params[:task]
		# 	@task = Task.find(params[:task])
		# else 
		# 	@task = Task.new(published_at: DateTime.now.to_date, deadline: DateTime.now.to_date)
		# end

	end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end
end
