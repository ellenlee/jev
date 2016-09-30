class ProjectUploadsController < ApplicationController
	before_action :set_project_group_and_team, :set_lesson

	def create
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

	def update
		@upload = @team.uploads.find(params[:id])
		@upload.update(upload_params)
		@upload.user = current_user
		@upload.upload_count += 1
		@upload.document_file_name = "#{@project.name}-#{@group.name}-第#{@team.num}組-第#{@upload.stage.num}週-#{@upload.assignment.num}-#{@upload.task.name}(#{@upload.upload_count})"

		if @upload.save
	    redirect_to project_lesson_path(@project, @lesson), notice: "您已更新#{@upload.document_file_name}"
	  else
	    redirect_to project_lesson_path(@project, @lesson), alert: "#{@upload.errors.full_messages.to_sentence}"
	  end
	end

	private
	def set_lesson
		@lesson = Lesson.find(params[:upload][:lesson_id])
	end

	def set_project_group_and_team
		@project = Project.find(params[:project_id])
		@group = current_user.group(@project)
		@team = current_user.active_team(@project)
	end

	def upload_params
		params.require(:upload).permit(:task_id, :user_id, :group_id, :team_id, :stage_id, :assignment_id, :document)
	end
end
