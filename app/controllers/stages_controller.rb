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
		# - 若否，跳轉能新建專案參加與團隊紀錄的頁面(teams#new)
			redirect_to new_user_team_path(current_user, project: params[:project_id])
			flash[:alert] = "請先完成登錄程序！"
		end	
	end



end
