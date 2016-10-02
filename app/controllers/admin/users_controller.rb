class Admin::UsersController < Admin::AdminController

	PERMIT_ACTIONS = {
		"登錄" => 'participate',
		"退出" => 'quit',
		"刪除多筆帳號" => 'delete',
	}

	def index
		@users = User.all
		@participation = Participation.new
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

	def show
		@user = User.find(params[:id])
		@projects = @user.projects
	end

	def import
		@project = Project.find(params[:participation][:project_id])
		@group   = Group.find(params[:participation][:group_id])

		User.import(params[:file], current_user, @project, @group)
    redirect_to new_admin_user_path, notice: "Users imported."
	end

	def bulk_update
		return redirect_to :back unless PERMIT_ACTIONS.include?(params[:commit])

	  ids = Array(params[:ids])
	  @users = ids.map{ |i| User.find_by_id(i) }.compact
	  @project = Project.find_by_id(params[:participation][:project_id])
	  @group   = Group.find_by_id(params[:participation][:group_id])
	
	  @succeed_cases = []
	  @fail_cases = []
	  @msg = []

	  behavior = PERMIT_ACTIONS[params[:commit]]
	  send("bulk_#{behavior}")

	  redirect_to admin_users_path, alert: "成功：#{@succeed_cases.to_sentence}|失效：#{@fail_cases.to_sentence}"
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :phone, :school, :password, :created_by, :self_login?)
	end

	def bulk_participate
		@users.each do |user| 
			new_record = user.participations.create(project: @project, group: @group)
			if new_record.save
				@succeed_cases << "#{user.name} 已登錄至#{@project.name}！"
			else
			  @fail_cases << "#{user.name} (#{new_record.errors.full_messages.to_sentence})"
			end
		end		
	end

	def bulk_quit
		@users.each do |user|
			if @participation = user.participations.where(status_id:1, project: @project).first
				@participation.status_id = 2
				if @participation.save
  				@succeed_cases << "#{user.name}退出#{@project.name}（已登記）"
				else
			  	@fail_cases << "#{user.name}(?)"
				end
			else
				@fail_cases << "#{user.name}(並無未參加本專案)"
  		end
  	end
  end

	def bulk_delete
		@users.each do |user|
			if user.participations.active_in == []
				user.destroy
				@succeed_cases << user.name
			else
				@fail_cases << "#{user.name} (已有登錄專案，不可刪除！)"
			end
		end
	end
end
