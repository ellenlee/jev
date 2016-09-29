class AddGroupidToAssignments < ActiveRecord::Migration[5.0]
  def change
  	add_column :assignments, :group_id, :integer
  	add_index :assignments, :group_id
  end
end
