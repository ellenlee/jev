class Task < ApplicationRecord
	belongs_to :stage

	has_many :teams, :through =>:task_achieved
	has_many :task_achieved, :dependent => :destroy

	has_many :users, :through =>:task_achieved
	has_many :task_achieved, :dependent => :destroy

	# has_attached_file :document
	# validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/vnd.ms-powerpoint application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

end
