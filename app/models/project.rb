class Project < ApplicationRecord
	validates_uniqueness_of :name
	validates_presence_of :name

	belongs_to :status, :class_name => "ProjStatus"
	belongs_to :category, :class_name => "ProjCategory"
	belongs_to :creator, :class_name => "User"

	has_many :project_groupships, dependent: :restrict_with_error
	has_many :groups, through: :project_groupships
	has_many :participations, dependent: :restrict_with_error
	has_many :users, through: :participations
	has_many :teams, dependent: :restrict_with_error

	has_many :stages
	has_many :tasks

	has_many :lessons, through: :stages
	has_many :assignments, through: :tasks
	# has_many :uploads, through: :stages

	scope :preparing, -> {where(status_id:1)}
	scope :active, -> {where(status_id:2)}
	scope :accomplish, -> {where(status_id:3)}
	scope :closed, -> {where(status_id:4)}

	def participants(group)
		self.participations.where(group: group)
	end

end