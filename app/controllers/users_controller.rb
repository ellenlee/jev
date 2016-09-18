class UsersController < ApplicationController

	def profile
		if params[:team_id]
			@team = Team.find_by_id(params[:team_id])
		else
			@team = Team.new
		end
	end

end
