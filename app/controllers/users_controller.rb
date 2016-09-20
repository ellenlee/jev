class UsersController < ApplicationController

	def profile
		if params[:team_id]
			@team = Team.find_by_id(params[:team_id])
		else
			@team = Team.new
		end

		



		# profile 裡列出學員參加的專案、所在group、分組(以專案，透過user-teamship，找到該user的team)

	end

end
