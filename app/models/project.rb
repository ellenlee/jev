class Project < ApplicationRecord
	has_many	:stages

	has_many :classrooms, :through =>:project_classroomships
	has_many :project_classroomships, :dependent => :destroy

end
