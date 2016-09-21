class ReviseTeamColumn < ActiveRecord::Migration[5.0]
  def change
  	add_column :teams, :project_id, :integer
  	add_index :teams, :project_id

  	add_column :participants, :group_id, :integer
  	add_index :participants, :group_id

  	remove_column :user_teamships, :group_id
  end
end
