class Stage < ApplicationRecord
	# belongs_to	:project
	has_many :tasks

end
