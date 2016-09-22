class Project < ApplicationRecord
	belongs_to :status, :class_name => "ProjStat"
	belongs_to :category, :class_name => "ProjCategory"
	belongs_to :creator, :class_name => "User"

	has_many :project_groupships, dependent: :destroy
	has_many :groups, through: :project_groupships
	has_many :participants, dependent: :destroy
	has_many :users, through: :participants
	has_many :teams

	has_many :stages
	# has_many :tasks
	# has_many :uploads

	


end
