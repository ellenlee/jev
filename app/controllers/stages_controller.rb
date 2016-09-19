class StagesController < ApplicationController
	before_action :authenticate_user!


	def index
		@project = Project.find_by_id(params[:project_id])
		@stages = @project.stages
		@stage = @stages.last
		@upload = Upload.new
	end

end
