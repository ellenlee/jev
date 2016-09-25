class Task < ApplicationRecord
	validates_uniqueness_of :name, :scope => :stage_id

	# belongs_to :project
	belongs_to :stage

	# has_many :teams, :through =>:uploads
	# has_many :uploads, :dependent => :destroy

	has_many :users, :through =>:uploads
	has_many :uploads, :dependent => :destroy

	
end
