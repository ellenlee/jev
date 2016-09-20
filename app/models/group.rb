class Group < ApplicationRecord

has_many :users
has_many :teams

has_many :project_groupships, dependent: :destroy
has_many :projects, through: :project_groupships

end
