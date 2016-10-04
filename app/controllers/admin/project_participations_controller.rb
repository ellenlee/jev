class Admin::ProjectParticipationsController < Admin::AdminController
	before_action :set_project

	def index
		
		@groups = @project.groups
		if params[:group].present?
			@group = Group.find(params[:group])
			@participants = @project.participations.where(group: @group).order(:status_id)
		else
			@participants = @project.participations.order(:status_id).order(:group_id)
		end

		respond_to do |format|
    	format.html
    	format.js
    end
	end

	def update
		participate_record = @project.participations.find(params[:id])
		user = participate_record.user
		if participate_record.update(status_id:2)
			team = user.active_team(@project)
			user.quit(team)
			redirect_to admin_project_participations_path(@project), alert: "#{user.name} 已退出 #{@project.name} "
		else
			redirect_to admin_project_participations_path(@project), alert: "#{participate_record.errors.full_messages.to_sentence}"
		end
	end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end

end
