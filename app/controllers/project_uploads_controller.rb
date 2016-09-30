class ProjectUploadsController < ApplicationController
	before_action :set_project_group_and_team

	def create
		@lesson = Lesson.find(params[:upload][:lesson_id])
		@stage = @lesson.stage
		@task = Task.find(params[:upload][:task_id])
		@assignment = @task.assignments.where(group: @group).first

		@upload = current_user.uploads.new(upload_params)
		@upload.document_file_name = "#{@project.name}-#{@group.name}-第#{@team.num}組-第#{@stage.num}週-#{@assignment.num}-#{@task.name}"

		

		if @upload.save
			if @assignment.deadline > @upload.created_at
				@upload.update(on_time: true)
			else
				@upload.update(on_time: false)
			end
	    redirect_to project_lesson_path(@project, @lesson)
	    flash[:notice] = "檔案已上傳"
	  else
	    redirect_to project_lesson_path(@project, @lesson)
	    flash[:alert] = "#{@upload.errors.full_messages.to_sentence}"
	  end
	end


	private
	def set_project_group_and_team
		@project = Project.find(params[:project_id])
		@group = current_user.group(@project)
		@team = current_user.active_team(@project)
	end

	def upload_params
		params.require(:upload).permit(:task_id, :user_id, :group_id, :team_id, :stage_id, :document)
	end
end
