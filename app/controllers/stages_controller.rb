class StagesController < ApplicationController
	before_action :authenticate_user!


	def index
		@stages = Stage.all
		@stage = Stage.last
		@upload = Upload.new 
	end

end
