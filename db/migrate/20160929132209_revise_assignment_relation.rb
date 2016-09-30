class ReviseAssignmentRelation < ActiveRecord::Migration[5.0]
  def change
  	add_column :assignments, :num, :integer
  end
end
