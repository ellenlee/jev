class RebuildProjectGroupRelation < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:project_groupships, :team_id
  	add_column		:project_groupships, :group_id, :integer
  	add_index			:project_groupships, :group_id
  	
  end
end
