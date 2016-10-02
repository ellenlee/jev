class Team < ApplicationRecord
	validates_uniqueness_of :num, scope: [:project_id, :group_id]

	belongs_to	:group
	belongs_to	:project

	has_many :teammateships, dependent: :restrict_with_error
	has_many :users, through: :teammateships
	has_many :uploads
	has_many :assignments, through: :group
	has_many :team_uploads, class_name: "Upload"

	# has_many :uploads
	
	def exist?
		active_teammates = self.teammateships.where(active: true)
		if active_teammates.any?
		  true
		else
			false
		end
	end

	def exist_status
		if self.exist?
			"活躍"
		else
			"撤組"
		end
	end

	def team_uploads(project, group)
    tasks_should_be_done = Task.team_tasks(project, group)
    self.uploads.where(task: tasks_should_be_done)
  end

  def team_uploads_count(project, group)
    team_uploads = self.team_uploads(project, group)
    team_uploads.count
  end

  def team_uploads_rate(project, group)
  	tasks_should_be_done = Task.team_tasks(project, group)
  	if team_uploads(project, group).any?
  		rate = team_uploads_count(project, group).to_f / tasks_should_be_done.count
  		(rate*100).round(0).to_s+"%"
  	end
  end


	def join_team
		# 加入專案後，叫出此project_id下的team，輸入他要加入的組號（num）
    #     - 是否組號在該group中已存在，
    #         - 若是，則編輯team-user關聯，加入該組
    #         - 若組號不存在於此專案下，則 創建並加入某小組（team-user建立關聯）
    # - 若participant / user_teamship 兩張關聯皆同時存檔成功，則表示學員已參加專案
    # - 跳轉 users#profile 
		
	end

end
