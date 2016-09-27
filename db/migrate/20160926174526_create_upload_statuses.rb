class CreateUploadStatuses < ActiveRecord::Migration[5.0]
  def change
    add_index :upload_statuses, :name, unique:true
  end
end
