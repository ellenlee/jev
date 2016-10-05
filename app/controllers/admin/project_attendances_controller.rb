class Admin::ProjectAttendancesController < Admin::AdminController
	before_action :set_project

	def index
		@stages = @project.stages.order(:num)
		@groups = @project.groups
	end

	def new
		@stages = @project.stages.order(:num)
		@groups = @project.groups

		if params[:stage].present? & params[:group].present?
			stage = @project.stages.find(params[:stage][:id])
			group = @project.groups.find(params[:group][:id])
			lesson = @project.lessons.where(group: group, stage: stage)
		end

		if lesson
			@lesson = lesson.first
			@participants = group.active_members(@project)
		end
	end


 def bulk_update
 	@lesson = Lesson.find(params[:lesson])
 	ids = Array(params[:ids])
 	lesson_members = ids.map { |i| User.find_by_id(i) }.compact
 	attend_ids = params[:attend].map { |i| i.to_i }
 	@succeed_cases = []
 	@fail_cases = []

 	lesson_members.each do |user|
 		record = user.attendances.find_or_initialize_by(user: user, lesson: @lesson )
 		if user.id.in?(attend_ids)
 			record.attend = true
 		else
 			record.attend = false
 		end
 		record.status = params["status_#{user.id}"][:status]
 		if record.save
 			@succeed_cases << user.name
 		else
 			@fail_cases << "#{user.name} (#{record.errors.full_messages.to_sentence})"
 		end
 	end
	redirect_to :back, alert: "成功：#{@succeed_cases.to_sentence}|失效：#{@fail_cases.to_sentence}"
	
 end

	private
	def set_project
		@project = Project.find(params[:project_id])
	end
end
