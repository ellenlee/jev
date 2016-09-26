class Stage < ApplicationRecord
	validates_uniqueness_of :name, :scope => :project_id

	belongs_to	:project
	has_many :tasks

end
