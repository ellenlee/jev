class BuildTeamRelation < ActiveRecord::Migration[5.0]
  def change
  	add_column	:teams, :project_id, :integer
  	add_index		:teams, :project_id
  	add_column	:teams, :group_id, :integer
  	add_index		:teams, :group_id
  	
  	add_column	:users, :group_id, :integer
  	add_index		:users, :group_id
  end
end
