class Participant < ApplicationRecord
validates_uniqueness_of :user_id, scope: :project_id

	belongs_to :project
	belongs_to :user
	belongs_to :parti_stat

end
