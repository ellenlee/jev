class Admin::UsersController < ApplicationController
	before_action :check_admin
	layout "admin"

	def index
		@users = User.all
	end

	def new
		@user = User.new
		@users = User.where(:created_by => current_user.id)
		# 之後要改成多個 admin 都看得見
	end

	def create

		@user = User.new(user_params)
		@user.password = @user.email
		@user.created_by = current_user.id

		if @user.save
			redirect_to new_admin_user_path
			flash[:notice] = "新增 #{@user.name}"
		else
			render :action => :new
		end
	end

	def bulk_update
	  ids = Array(params[:ids])
	  users = ids.map{ |i| User.find_by_id(i) }.compact

	  if params[:commit] == "sign in project"
	    users.each{ |user| Participant.create!( project_id: params[:project], group_id: params[:group], user: user) }
	    redirect_to admin_users_path, notice: "您已成功將學員登錄至專案下的班級！"
	  elsif params[:commit] == "delete users"
	    users.each{ |user| user.destroy }
	    redirect_to admin_users_path, alert: "您已成功將帳號刪除！"
	  end
	end

	private

	def check_admin
		redirect_to root_path, :notice =>"Oooops?!" unless current_user.admin?
	end	

	def user_params
		params.require(:user).permit(:name, :email, :phone, :school, :password, :created_by, :self_login?)
	end

end
