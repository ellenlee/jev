class UploadsController < ApplicationController


	def create
		@upload = Upload.new(upload_params)
		@upload.user = current_user
		@upload.task_id = params[:task_id]

		if @upload.save
	    redirect_to stages_path
	    flash[:notice] = "檔案已上傳"
	  else
	    render project_stages_path
	    flash[:alert] = "好像有點問題，再檢查一下哦！"
	  end
	end

	def edit
		
	end

	def updatek
		
	end

	private

	def upload_params
		params.require(:upload).permit(:user_id ,:task_id, :document)
	end
end
