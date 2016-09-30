class AddOnTimeColumnToUpload < ActiveRecord::Migration[5.0]
  def change
  	add_column :uploads, :on_time, :boolean
  	remove_column :uploads, :status_id
  	# drop_table :upload_statuses
  end
end
