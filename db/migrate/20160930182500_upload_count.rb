class UploadCount < ActiveRecord::Migration[5.0]
  def change
  	add_column :uploads, :upload_count, :integer, default: 1
  end
end
