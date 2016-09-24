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
		@groups = @project.groups
		
		if params[:group].present?
			@group = Group.find(params[:group])
			@participants = @project.participations.where(group: @group).order(:status_id)
		else
			@participants = @project.participations.order(:status_id).order(:group_id)
		end

		respond_to do |format|
    	format.html
    	format.js
    end
	end

	def edit
		set_project
	end

	def update
		set_project
		@project.update(project_params)

		if @project.save
			redirect_to admin_project_path(@project)
			flash[:notice] = "編輯專案 #{@project.name} 成功！"
		else
			render :action => :edit
		end
	end

	def destroy
		set_project
		if @project.users.any?
			redirect_to edit_admin_project_path(@project)
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
		params.require(:project).permit(:name, :info, :category_id, :status_id, :creator_id, :group_ids => [])
	end

	def set_project
		@project = Project.find(params[:id])
	end

end
