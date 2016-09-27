class Task < ApplicationRecord
	validates_uniqueness_of :name, :scope => :stage_id
	validates_uniqueness_of :num, :scope => :stage_id
	validates_presence_of :num, :name, :published_at, :deadline

	belongs_to :stage

	# has_many :teams, :through =>:uploads
	# has_many :uploads, :dependent => :destroy

	has_many :users, :through =>:uploads
	has_many :uploads, dependent: :restrict_with_error
end
