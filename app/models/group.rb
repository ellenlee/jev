class Group < ApplicationRecord
	validates_uniqueness_of :name
	validates_presence_of :name

	has_many :teams
	has_many :participations, dependent: :restrict_with_error
	has_many :users, through: :participations

	has_many :project_groupships, dependent: :restrict_with_error
	has_many :projects, through: :project_groupships

	has_many :lessons
	has_many :stages, through: :lessons

	has_many :assignments
	has_many :tasks, through: :assignments
	# has_many :uploads, through: :assignments
	
end
