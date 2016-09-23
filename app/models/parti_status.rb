class PartiStatus < ApplicationRecord
	validates_uniqueness_of :name

	has_many :participations
end
