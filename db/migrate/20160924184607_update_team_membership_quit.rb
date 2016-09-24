class UpdateTeamMembershipQuit < ActiveRecord::Migration[5.0]
  def change
  	change_column :team_memberships, :has_quit?, :boolean, default: false
  end
end
