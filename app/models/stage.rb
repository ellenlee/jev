class Stage < ApplicationRecord
	validates_uniqueness_of :num, :scope => :project_id

	belongs_to	:project
	
	has_many :lessons, dependent: :restrict_with_error
	has_many :groups, through: :lessons
	has_many :attendances, through: :lessons
	has_many :attend_members, through: :attendances, source: :user
	
	has_many :assignments
	has_many :tasks, through: :assignments
	# has_many :uploads, through: :assignments
	# has_many :uploads, through: :assignment

	def lesson(group)
		lesson = self.lessons.where(group: group)
		lesson.first if lesson.any?
	end

	def lesson_name(group)
		lesson = lesson(group)
		lesson.name if lesson
	end

	def attendance(group)
		lesson = self.lessons.where(group: group)
		if lesson.any?
			records = lesson.first.attendances
		end
	end

	def attendance_count(group, if_attend)
		records = self.attendance(group)
		records.where(attend: if_attend).count if records
	end

	def attendance_with_status(group, status)
		records = attendance(group)
		list = records.where(status: status) if records
		list.count if list
	end

end
