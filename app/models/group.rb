class Group < ApplicationRecord

has_many :teams

has_many :project_groupships, dependent: :destroy
has_many :projects, through: :project_groupships

has_many :participants, dependent: :destroy
has_many :users, through: :participants

end
