class Participant < ApplicationRecord
	belongs_to :project
	belongs_to :classroom
	belongs_to :team
	belongs_to :user

end
