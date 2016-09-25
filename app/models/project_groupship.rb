class ProjectGroupship < ApplicationRecord
	validates_uniqueness_of :group_id, scope: :project_id


	belongs_to	:project
	belongs_to	:group
end
