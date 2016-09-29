class Stage < ApplicationRecord
	validates_uniqueness_of :num, :scope => :project_id

	belongs_to	:project
	
	has_many :lessons, dependent: :destroy
	has_many :groups, through: :lessons
	
	has_many :assignments, dependent: :destroy
	has_many :tasks, through: :assignments
	has_many :uploads, through: :tasks
	# has_many :uploads, through: :assignment

	def lesson(group)
		self.lessons.where(group: group).first
	end

end
