class CreateUploadStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :upload_statuses do |t|
    	t.string	:name
    	t.index		:name, unique: true
      t.timestamps
    end
    add_column :uploads, :status_id, :integer, default: 3
    add_index  :uploads, :status_id
  end
end
