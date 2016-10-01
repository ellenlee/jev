class Assignment < ApplicationRecord
	validates_uniqueness_of :task_id, scope: [:group_id, :stage_id]
	validates_presence_of :assigned_at, :deadline, :group_id, :stage_id, :task_id

	belongs_to :task
	belongs_to :group
	belongs_to :stage

	has_many :uploads, dependent: :restrict_with_error


	def find_upload(user)
		project = self.task.project
		task = self.task
		team = user.active_team(project)

		if task.team_work?
			team.uploads.where(task: task, team: team).last
		else
			team.uploads.where(task: task, user: user).last
		end
	end
end
