class Attendance < ApplicationRecord
	enum status: [ :punctual, :late, :leave, :absent]

	belongs_to :user
	belongs_to :lesson
	

end
