class Upload < ApplicationRecord
	# validates_uniqueness_of :assignment_id, scope: [:group_id, :stage_id]

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

 	def generate_file_name
 		task = self.task
 		assign = self.assignment
 		project = task.project
 		group = assign.group
 		stage = assign.stage

 		if task.team_work?
 			team = self.team
 			self.document_file_name = "#{project.name}-#{group.name}-第#{team.num}組-第#{stage.num}週-#{assign.num}-#{task.name}"
 		else
 			user = self.user
 			self.document_file_name = "#{project.name}-#{group.name}-#{user.name}-第#{stage.num}週-#{assign.num}-#{task.name}"
 		end
 	end

end
