class AddProjectToMembership < ActiveRecord::Migration[5.0]
  def change
  	add_column :team_memberships, :project_id, :integer
  	add_index :team_memberships, [:project_id, :team_id], unique: true
  	add_column :teams, :active?, :boolean, default: true
  end
end
