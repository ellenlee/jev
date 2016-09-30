class Task < ApplicationRecord
	validates_uniqueness_of :name, :scope => :project_id
	validates_uniqueness_of :num, :scope => :project_id
	validates_presence_of :num, :name

	belongs_to :project
	
	has_many :assignments, dependent: :destroy
	has_many :stages, through: :assignments
	has_many :groups, through: :assignments

	# has_many :users, :through =>:uploads
	# has_many :uploads, dependent: :restrict_with_error
end
