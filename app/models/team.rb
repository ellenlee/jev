class Team < ApplicationRecord
	validates_uniqueness_of :num, scope: [:project_id, :group_id]

	belongs_to	:group
	belongs_to	:project

	has_many :team_memberships, dependent: :restrict_with_error
	has_many :users, through: :team_memberships


	
	def join_team
		# 加入專案後，叫出此project_id下的team，輸入他要加入的組號（num）
    #     - 是否組號在該group中已存在，
    #         - 若是，則編輯team-user關聯，加入該組
    #         - 若組號不存在於此專案下，則 創建並加入某小組（team-user建立關聯）
    # - 若participant / user_teamship 兩張關聯皆同時存檔成功，則表示學員已參加專案
    # - 跳轉 users#profile 
		
	end

end
