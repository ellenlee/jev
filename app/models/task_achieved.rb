class TaskAchieved < ApplicationRecord

	belongs_to :team
	belongs_to :user
	belongs_to :task
end
