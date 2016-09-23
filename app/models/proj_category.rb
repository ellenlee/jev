class ProjCategory < ApplicationRecord
	validates_uniqueness_of :name
	has_many :projects
end
