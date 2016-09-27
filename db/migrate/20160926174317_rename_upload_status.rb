class RenameUploadStatus < ActiveRecord::Migration[5.0]
  def change
  	drop_table :uploads_statuses
  end
end
