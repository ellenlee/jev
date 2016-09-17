class Upload < ApplicationRecord
	belongs_to	:task
	# belongs_to	:team
	belongs_to	:user

	has_attached_file :document
	validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-powerpointt application/vnd.openxmlformats-officedocument.presentationml.presentation)}

end
