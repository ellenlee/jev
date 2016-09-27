class Upload < ApplicationRecord

	belongs_to :status, :class_name => "UploadStatus"

	belongs_to	:project
	belongs_to 	:stage
	belongs_to	:task
	# belongs_to	:team
	belongs_to	:user

	has_attached_file :document
	validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-powerpointt application/vnd.openxmlformats-officedocument.presentationml.presentation)}

	# has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 #  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

end
