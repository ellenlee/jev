class RenameBooleanColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tasks, :team_work?, :team_work
  	rename_column :teammateships, :active?, :active
  	rename_column :teams, :exist?, :exist
  end
end
