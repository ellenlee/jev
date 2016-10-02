class Participation < ApplicationRecord
	validates_uniqueness_of :user_id, scope: :project_id

	belongs_to :project
	belongs_to :user
	belongs_to :group
	belongs_to :status, :class_name => "PartiStatus"

	scope :active_in, -> {where(status_id: 1)}
	scope :has_quit, -> {where(status_id: 2)}
	scope :accomplish, -> {where(status_id: 3)}


	def self.active_count(project)
		self.where(status_id:1, project: project).count
	end

	def self.quit_count(project)
		self.where(status_id: 2, project: project).count
	end

	def self.accomplish_count(project)
		self.where(status_id: 3, project: project).count
	end

	def self.status(project, user)
		self.where(project: project, user: user).first.status.name
	end

	def self.group(project, user)
		self.where(project: project, user: user).first.group.name
	end
end
