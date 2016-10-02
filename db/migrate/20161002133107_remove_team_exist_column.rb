class RemoveTeamExistColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :teams, :exist
  end
end
