class Classroom < ApplicationRecord
	has_many :project_classroomships, :dependent => :destroy
	has_many :projects, :through => :project_classroomships
	
	# has_many :teams

	has_many :participants, :dependent => :destroy
	has_many :projects, :through => :participants
	has_many :users, :through => :participants
	has_many :teams, :through => :participants

end
