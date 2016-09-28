class Group < ApplicationRecord
	validates_uniqueness_of :name
	validates_presence_of :name

	has_many :teams
	has_many :participations, dependent: :restrict_with_error
	has_many :users, through: :participations

	has_many :project_groupships, dependent: :destroy
	has_many :projects, through: :project_groupships

	has_many :stages
	has_many :tasks, through: :stages
	has_many :uploads, through: :stages
	
end
