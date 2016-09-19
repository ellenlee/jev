class Project < ApplicationRecord
	belongs_to :status

	has_many :stages

	has_many :participants, :dependent => :destroy
	has_many :users, :through => :participants

	# has_many :tasks
	# has_many :uploads

	


end
