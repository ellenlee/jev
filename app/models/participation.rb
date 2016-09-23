class Participation < ApplicationRecord
validates_uniqueness_of :user_id, scope: :project_id

	belongs_to :project
	belongs_to :user
	belongs_to :group
	belongs_to :status, :class_name => "PartiStatus"

	scope :active_in, -> {where(status_id: 1)}
	scope :has_quit, -> {where(status_id: 2)}
	scope :accomplish, -> {where(status_id: 3)}
end
