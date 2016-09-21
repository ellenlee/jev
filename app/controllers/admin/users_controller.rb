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

	  if params[:commit] == "登錄專案"
	    users.each do |user| 
	    	participant = Participant.create( project_id: params[:project], user: user)
	    	if participant.errors.any?
	    		redirect_to(admin_users_path, alert: "學員已登錄同一專案了！")
	    		return
	    	else
	    		redirect_to admin_users_path, notice: "您已成功將學員登錄至專案下的班級！"
	    	end
	    end
	  elsif params[:commit] == "刪除多筆帳號"
	    users.each{ |user| user.destroy }
	    redirect_to admin_users_path, alert: "您已成功將帳號刪除！"
	  elsif params[:commit] == "群組寄信"
	    	
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
