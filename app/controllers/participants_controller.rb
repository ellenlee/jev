class ParticipantsController < ApplicationController
	def create
		@participant = Participant.new(participant_params)

		if @participant.save
			redirect_to :back
			flash[:notice] = "恭喜您完成專案登錄，偉大的旅程就此開始！"
		else
			render "teams/new"
			flash[:alert] = "好像有問題，麻煩您再檢查一下⋯⋯"
		end
	
	end


	private

	def participant_params
		params.require(:participant).permit(:project_id, :user_id)
	end

end


