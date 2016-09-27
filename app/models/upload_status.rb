class UploadStatus < ApplicationRecord
	validates_uniqueness_of :name
	validates_presence_of :name

	has_many :uploads
end
