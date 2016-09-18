class TeamsController < ApplicationController

	def create
		@team = Team.new(team_params)
		
		if @team.save
			create_team_member_ship
			if @participant.save
				redirect_to profile_user_path(current_user)
				flash[:notice] = "新增成功"
			else
			render "users/profile"
			end
		end
	end

	def edit
		
	end

	# PUT /teams/:id (put or patch? )
	def update
		
		# 呼叫participant，以原有team_id，查找該 user 的這筆專案/班級/組別（一個專案-user，必定只有一筆資料）
		@participant = current_user.participants.find_by_team_id(params[:id])
		cid = params[:team][:classroom_id].to_i
		pid = params[:team][:classroom_id].to_i
		num = params[:team][:num].to_i

		# 是否在該專案班級下，已經有這個小組號碼？
		if Team.where(classroom_id: cid, num: num).exists?
			# 若是，直接將資料表裡的 class, team 指向新的位址
			@participant.classroom_id = cid
			@participant.team = Team.where(classroom_id: cid, num: num).first

		# 若否，新建 team 之後，再將 class, team 指向新的位址
		else
			@team = Team.new(classroom_id: cid, project_id: pid, num: num)
			@team.save!

			@participant.classroom_id = cid
			@participant.team = @team 
		end

		# 存檔
		if @participant.save!
				redirect_to profile_user_path(current_user)
				flash[:notice] = "修改成功"
		else
			render "users/profile"
		end	
		
	end


	private

	def set_team
		@team = Team.find_by_id(params[:id])
	end

	def create_team_member_ship
		@participant = Participant.create(user: current_user, team: @team, project: @team.project, classroom: @team.classroom)
	end

	def team_params
		params.require(:team).permit(:project_id, :classroom_id, :num)
	end

end
