class Task < ApplicationRecord
	# belongs_to :project
	belongs_to :stage

	# has_many :teams, :through =>:uploads
	# has_many :uploads, :dependent => :destroy

	has_many :users, :through =>:uploads
	has_many :uploads, :dependent => :destroy

	
end
