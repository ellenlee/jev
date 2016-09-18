class Team < ApplicationRecord
	belongs_to :classroom
	
	has_many :participants, :dependent => :destroy
	has_many :users, :through => :participants

end
