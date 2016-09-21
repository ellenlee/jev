class Admin::ProjectsController < ApplicationController
	before_action :check_admin
	layout "admin"

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
		
	end

	def create
		@project = Project.new(project_params)
		@project.creator = current_user

		if @project.save
			redirect_to admin_project_path(@project)
			flash[:notice] = "新增專案 #{@project.name} 成功！"
		else
			render :action => :new
		end
	end

	def show
		set_project
		@users = @project.users
		@groups = @project.groups
	end

	def edit
		set_project
	end

	def update
		set_project
		@project.update(project_params)

		if @project.save
			redirect_to admin_project_path(@project)
			flash[:notice] = "新增專案 #{@project.name} 成功！"
		else
			render :action => :edit
		end
	end

	def destroy
		set_project
		if @project.users.any?
			redirect_to admin_project_path(@project)
			flash[:alert] = "已有人加入此專案，建議您改變專案狀態，而非刪除！"
		else
			@project.destroy
			redirect_to admin_projects_path
			flash[:alert] = "您已經刪除 #{@project.name} ！"
		end
	end

	private
	def check_admin
		redirect_to root_path, :notice =>"Oooops?!" unless current_user.admin?
	end	

	def project_params
		params.require(:project).permit(:name, :info, :proj_category_id, :proj_stat_id, :creator_id)
	end

	def set_project
		@project = Project.find(params[:id])
	end

end
