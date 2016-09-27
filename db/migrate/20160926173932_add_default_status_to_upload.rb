class AddDefaultStatusToUpload < ActiveRecord::Migration[5.0]
  def change
  	change_column :uploads, :status_id, :integer, default: 3
  end
end
