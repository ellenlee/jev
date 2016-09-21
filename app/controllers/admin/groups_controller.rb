class Admin::GroupsController < ApplicationController
	before_action :check_admin
	before_action :set_group, except: [:index, :create]
	layout "admin"

	def index
		@groups = Group.all
		
		if params[:id]
			set_group
		else
			@group = Group.new
		end
	end

	def create
		@group = Group.new(group_params)
		if @group.save
			redirect_to admin_groups_path
			flash[:notice] = "新建班級 #{@group.name} 成功！"
		else
			render :action => :index
		end
	end

	def update
		if @group.update(group_params)
			redirect_to admin_groups_path
			flash[:notice] = "修改班級 #{@group.name} 成功！"
		else
			render :action => :index
		end
	end

	def destroy
		if @group.projects.any?
			redirect_to admin_groups_path
			flash[:alert] = "已有專案在本班級下開辦，請勿刪除！"
		else
			@group.destroy
			redirect_to admin_groups_path
			flash[:alert] = "您已經刪除 #{@group.name} ！"
		end
	end

	private
	def check_admin
		redirect_to root_path, :notice =>"Oooops?!" unless current_user.admin?
	end

	def group_params
		params.require(:group).permit(:name)
	end

	def set_group
		@group = Group.find(params[:id])
	end
	
end
