class Stage < ApplicationRecord
	validates_presence_of :name, :num
	validates_uniqueness_of :name, :scope => :project_id
	validates_uniqueness_of :num, :scope => [:project_id, :group_id]

	belongs_to	:project
	has_many :tasks

end
