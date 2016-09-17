class UploadsController < ApplicationController


	def create
		@upload = Upload.create(upload_params)
		@upload.user = current_user

		if @upload.save
	    redirect_to stages_path
	    flash[:notice] = "<%= @upload.file_name %> 已上傳"
	  else
	    redirect_to stages_path
	    flash[:alert] = "好像有點問題，再檢查一下哦！"
	  end
	end

	private

	def upload_params
		params.require(:upload).permit(:document)
	end
end
