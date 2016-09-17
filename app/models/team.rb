class Team < ApplicationRecord

	belongs_to :classroom

	# has_many :users, :through =>:team_memberships
	# has_many :team_memberships, :dependent => :destroy

	has_many :tasks, :through =>:uploads
	has_many :uploads, :dependent => :destroy

end
