class Attendance < ApplicationRecord
	validates_uniqueness_of :user_id, scope: :lesson_id

	enum status: [ :punctual, :late, :leave, :absent]

	belongs_to :user
	belongs_to :lesson
	belongs_to :project, optional: true
	

end
