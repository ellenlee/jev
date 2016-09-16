class Classroom < ApplicationRecord

	has_many :teams

	has_many :projects, :through =>:project_classroomships
	has_many :project_classroomships, :dependent => :destroy

end
