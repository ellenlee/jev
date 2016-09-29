class Admin::ProjectLessonsController < Admin::AdminController
	before_action :set_project

	def create
		@lesson = Lesson.new(lesson_params)
		if @lesson.save
			redirect_to admin_project_stages_path(@project)
			flash[:notice] = "新增 #{@project.name} 課程：第#{@lesson.stage.num}週 #{@lesson.group.name }成功！"
		else
			redirect_to admin_project_stages_path(@project), alert: "#{@lesson.errors.full_messages.to_sentence}"
		end
	end

	private
	def lesson_params
		params.require(:lesson).permit(:name, :stage_id, :group_id, :published_at)
	end

	def set_project
		@project = Project.find(params[:project_id])
	end
end
