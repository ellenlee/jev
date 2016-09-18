class Project < ApplicationRecord

	has_many :project_classroomships, :dependent => :destroy
	has_many :classrooms, :through => :project_classroomships
	
	has_many :participants, :dependent => :destroy
	has_many :users, :through => :participants
	has_many :classrooms, :through => :participants
	has_many :teams, :through => :participants

end
