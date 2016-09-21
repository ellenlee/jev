class Participant < ApplicationRecord

	belongs_to :project
	belongs_to :user
	belongs_to :group

end
