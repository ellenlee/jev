class StagesController < ApplicationController
	before_action :authenticate_user!
	

	def index
		@stages = Stage.all
	end
end
