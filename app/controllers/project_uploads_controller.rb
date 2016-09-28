class ProjectUploadsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@task = Task.find(params[:upload][:task_id])
		@stage = @task.stage
		@upload = @task.uploads.new(upload_params)
		@upload.user = current_user

		if @upload.save
	    redirect_to project_stage_path(@project, @stage)
	    flash[:notice] = "檔案已上傳"
	  else
	    redirect_to project_stage_path(@project, @stage)
	    flash[:alert] = "好像有點問題，再檢查一下哦！"
	  end
	end

	def upload_params
		params.require(:upload).permit(:user_id ,:task_id, :document)
	end
end
