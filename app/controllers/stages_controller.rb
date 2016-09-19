class StagesController < ApplicationController
	before_action :check_participation


	def index
		set_project
		@stages = @project.stages
		@stage = @stages.last
		@upload = Upload.new




	end

	private

	def set_project
		@project = Project.find_by_id(params[:project_id])	
	end

	def check_participation
		set_project
	# 驗證是否學員已參加該專案（是否能以project找得到user）
		if @project.users.include?(current_user)
		# - 若是：看見專案內頁（stage.index）
		else
		# - 若否，跳轉 user profile
			redirect_to profile_user_path(current_user)
			flash[:alert] = "您尚未加入此專案，請建立參加紀錄！"
		end	
	end



end
