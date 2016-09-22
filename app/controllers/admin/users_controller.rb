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

	  succeed_cases = []
	  fail_cases = []

	  if params[:commit] == "登錄專案"
	    users.each do |user| 
	    	@participant = Participant.new( project_id: params[:project], user: user)
	    	if @participant.save
	    		succeed_cases << user.name
	    	else
	    	  fail_cases << user.name
	    	end
	    end										
	    redirect_to admin_users_path, notice: "成功登錄：#{succeed_cases}；\r\n未登錄：#{fail_cases} - #{@participant.errors.full_messages}"
	  elsif params[:commit] == "移出專案"
	  	users.each do |user|
	  		if @participant = Participant.where( project_id: params[:project], user: user).first
	  			@participant.destroy
	  			succeed_cases << user.name
	  		end
	  	end
	  	redirect_to admin_users_path, notice: "已將 #{succeed_cases} 移出 #{Project.find(params[:project]).name}"
	  elsif params[:commit] == "刪除多筆帳號"
	    users.each do |user| 
	    	user.destroy
	    	succeed_cases << user.name 
	    end
	    redirect_to admin_users_path, alert: "您已成功將#{succeed_cases}刪除！"
	  elsif params[:commit] == "群組寄信"
	    	# 未製作
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
