class Team < ApplicationRecord

	belongs_to :classroom

	has_many :users, :through =>:team_memberships
	has_many :team_memberships, :dependent => :destroy

	has_many :tasks, :through =>:task_achieved
	has_many :task_achieved, :dependent => :destroy

end
