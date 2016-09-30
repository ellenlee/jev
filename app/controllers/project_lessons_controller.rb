class ProjectLessonsController < ApplicationController
	before_action :set_project

	def show
		@lesson = Lesson.find(params[:id])
		@stage = @lesson.stage
		@group = @lesson.group
		@team = current_user.active_team(@project)
		# @assignment = @stage.assignment.
		@tasks = @stage.tasks.order(:num)
		@upload = Upload.new
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

	def check_participant?
		redirect_to root_path, :notice =>"您尚未參加本專案，請洽工作團隊完成專案登錄（TEL: 09XX-XXX-XXX）" unless current_user.participations.where(project: @project, status_id: 1).exists? 
	end
end
