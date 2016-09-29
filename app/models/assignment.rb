class Assignment < ApplicationRecord
	validates_uniqueness_of :task_id, scope: [:stage_id, :group_id]
	validates_presence_of :assigned_at, :deadline

	belongs_to :stage
	belongs_to :task
	belongs_to :group
end
