class Task < ApplicationRecord
	validates_uniqueness_of :name, :scope => :project_id
	validates_uniqueness_of :num, :scope => :project_id
	validates_presence_of :num, :name

	belongs_to :project
	
	has_many :assignments, dependent: :destroy
	has_many :stages, through: :assignments
	has_many :groups, through: :assignments
	has_many :uploads, through: :assignments

	# has_many :users, :through =>:uploads
	# has_many :uploads, dependent: :restrict_with_error

	def team_work_show
		if self.team_work == true
			"小組"
		else
			"個人"
		end	
	end

	def upload_rate(group)
		if assign = group.assignments.where(task: self).last
			assign.upload_rate
		else
			nil
		end
	end

	def self.personal_tasks(project, group)
		group.tasks.where(project: project, team_work: false)
	end

	def self.team_tasks(project, group)
		group.tasks.where(project: project, team_work: true)
	end

end
