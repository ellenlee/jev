class RenameMembershipQuitColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :team_memberships, :has_quit?, :active?
  	change_column :team_memberships, :active?, :boolean, default: true
  end
end
