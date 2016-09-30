class Assignment < ApplicationRecord
	validates_uniqueness_of :task_id, scope: [:group_id, :stage_id]
	validates_presence_of :assigned_at, :deadline

	belongs_to :task
	belongs_to :group
	belongs_to :stage
end
