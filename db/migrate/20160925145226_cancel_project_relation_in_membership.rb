class CancelProjectRelationInMembership < ActiveRecord::Migration[5.0]
  def change
  	remove_index :team_memberships, [:project_id, :team_id]
  	remove_column :team_memberships, :project_id
  	add_index :project_groupships, [:project_id, :group_id], unique: true
  	add_index :parti_statuses, :name, unique: true
		add_index :proj_statuses, :name, unique: true
		add_index :proj_categories, :name, unique: true
		add_index :projects, :name, unique: true
		add_index :groups, :name, unique: true
  end
end
