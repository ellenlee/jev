class Lesson < ApplicationRecord
	validates_presence_of :name

	belongs_to :stage
	belongs_to :group

	has_many :attendances
	has_many :attend_members, through: :attendances, source: :user
end
