class ProjectLessonsController < ApplicationController
	before_action :set_project_group_and_team

	def show
		@lesson = Lesson.find(params[:id])
		@stage = @lesson.stage
		@tasks = @group.tasks.joins(:stages).where(:stages=>{num:1}).order(:num)
		@assignments = @group.assignments.where(stage: @stage).order(:num)
		@upload = current_user.uploads.new

		# if params[:task]
		# 	@task = Task.find(params[:task])
		# else 
		# 	@task = Task.new(published_at: DateTime.now.to_date, deadline: DateTime.now.to_date)
		# end

	end

	private
	def set_project_group_and_team
		@project = Project.find(params[:project_id])
		@group = current_user.group(@project)
		@team = current_user.active_team(@project)
	end

	def check_participant?
		redirect_to root_path, :notice =>"您尚未參加本專案，請洽工作團隊完成專案登錄（TEL: 09XX-XXX-XXX）" unless current_user.participations.where(project: @project, status_id: 1).exists? 
	end
end
