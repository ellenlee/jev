class Admin::ProjectLessonsController < Admin::AdminController
	before_action :set_project
	before_action :set_lesson, except: :create

	def create
		@lesson = @project.lesson.new(lesson_params)
		if @lesson.save
			redirect_to admin_project_stages_path(@project)
			flash[:notice] = "新增 #{@project.name} 課程：第#{@lesson.stage.num}週 #{@lesson.group.name }成功！"
		else
			redirect_to admin_project_stages_path(@project), alert: "#{@lesson.errors.full_messages.to_sentence}"
		end
	end

	def update
		
		if @lesson.update(lesson_params)
			redirect_to admin_project_stages_path(@project)
			flash[:notice] = "修改 #{@project.name} 課程：第#{@lesson.stage.num}週 #{@lesson.group.name }成功！"
		else
			redirect_to admin_project_stages_path(@project), alert: "#{@lesson.errors.full_messages.to_sentence}"
		end
	end

	def destroy
		if @lesson.destroy
			redirect_to admin_project_stages_path(@project), alert: "您已刪除 #{@lesson.group.name}-第#{@lesson.stage.num}週-課程 #{@lesson.name}"
		else
			redirect_to admin_project_stages_path(@project), alert: "#{@lesson.errors.full_messages.to_sentence}"
		end
	end

	private
	def lesson_params
		params.require(:lesson).permit(:name, :stage_id, :group_id, :published_at)
	end

	def set_lesson
		@lesson = @project.lessons.find(params[:id])
	end

	def set_project
		@project = Project.find(params[:project_id])
	end
end
