class ParticipantsController < ApplicationController
	
	def new
		@project = Project.find_by_id(params[:project])
		@participant = Participant.new
	end


	def create
		@participant = Participant.new(participant_params)
		@participant.user = current_user

		if @participant.save
			# if user



			redirect_to :back
			flash[:notice] = "恭喜您完成專案登錄，偉大的旅程就此開始！"
		else
			render "participants/new"
			flash[:alert] = "好像有問題，麻煩您再檢查一下⋯⋯"
		end
	
	end


	private

	def participant_params
		params.require(:participant).permit(:project_id, :user_id)
	end

end


