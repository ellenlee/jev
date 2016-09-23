class Project < ApplicationRecord
	belongs_to :status, :class_name => "ProjStatus"
	belongs_to :category, :class_name => "ProjCategory"
	belongs_to :creator, :class_name => "User"

	has_many :project_groupships, dependent: :restrict_with_error
	has_many :groups, through: :project_groupships
	has_many :participations, dependent: :restrict_with_error
	has_many :users, through: :participations
	has_many :teams, dependent: :restrict_with_error

	has_many :stages
	# has_many :tasks
	# has_many :uploads

	


end
