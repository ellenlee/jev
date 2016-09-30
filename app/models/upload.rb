class Upload < ApplicationRecord
	validates_uniqueness_of :team_id, scope: [:group_id, :stage_id]

	# belongs_to :status, :class_name => "UploadStatus"
	belongs_to	:user
	belongs_to	:team
	
	belongs_to	:project, optional: true
	belongs_to 	:stage, optional: true
	belongs_to  :group, optional: true
	belongs_to  :task, optional: true
	belongs_to	:assignment, optional: true
	
	has_attached_file :document
	validates_attachment :document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-powerpointt application/vnd.openxmlformats-officedocument.presentationml.presentation)}

	# has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
 #  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

end
