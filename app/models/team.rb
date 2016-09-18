class Team < ApplicationRecord
	belongs_to :classroom
	belongs_to :project

	has_many :participants, :dependent => :destroy
	has_many :users, :through => :participants
	has_many :classrooms, :through => :participants
	
end
