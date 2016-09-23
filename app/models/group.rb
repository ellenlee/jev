class Group < ApplicationRecord

has_many :teams
has_many :participations, dependent: :restrict_with_error
has_many :users, through: :participations

has_many :project_groupships, dependent: :destroy
has_many :projects, through: :project_groupships

end
