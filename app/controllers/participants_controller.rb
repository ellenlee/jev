class ParticipantsController < ApplicationController
	def create
		@participant = Participant.new(participant_params)
		@participant.user = current_user
		
		if @participant.save
			redirect_to profile_user_path(current_user)
			flash[:notice] = "新增成功"
		else
			render "users/profile"
			flash[:alert] = "新增失敗"
		end
	
	end


	private

	def participant_params
		params.require(:participant).permit(:project_id, :classroom_id, :team_id)
	end

end


