class Admin::TeamsController < Admin::AdminController

	def index
		@teams = Team.all.order(:project_id).order(:group_id).order(:num)
		@projects = Project.all
		@groups = Group.all
		
	end

end
