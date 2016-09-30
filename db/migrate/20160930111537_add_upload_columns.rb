class AddUploadColumns < ActiveRecord::Migration[5.0]
  def change
  	add_column :uploads, :assignment_id, :integer
  	add_column :uploads, :team_id, :integer
  	add_column :uploads, :group_id, :integer
  	add_column :uploads, :stage_id, :integer
  end
end
