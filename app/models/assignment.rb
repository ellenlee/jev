class Assignment < ApplicationRecord
	validates_uniqueness_of :task_id, scope: [:group_id, :stage_id]
	validates_presence_of :assigned_at, :deadline, :group_id, :stage_id, :task_id

	belongs_to :task
	belongs_to :group
	belongs_to :stage

	has_many :uploads, dependent: :restrict_with_error

	def lesson
		group = self.group
		stage = self.stage
		Lesson.where(group: group, stage: stage).last
	end

	def should_upload_count
		project = self.task.project
		if self.task.team_work?
			self.group.active_teams(project).count
		else
			self.group.active_members(project).count
		end
	end

	def not_upload_count
		self.should_upload_count - self.uploads.count
	end

	def upload_rate
		upload_proportion = self.uploads.count.to_f / self.should_upload_count
		(upload_proportion*100).round(0).to_s+"%"
	end

	def find_upload(user)
		project = self.task.project
		team = user.active_team(project)

		if self.task.team_work?
			team.uploads.where(task: task, team: team).last
		else
			team.uploads.where(task: task, user: user).last
		end
	end



end
