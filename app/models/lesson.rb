class Lesson < ApplicationRecord
	validates_presence_of :name

	belongs_to :stage
	belongs_to :group

	
end
