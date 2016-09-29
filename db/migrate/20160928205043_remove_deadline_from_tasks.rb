class RemoveDeadlineFromTasks < ActiveRecord::Migration[5.0]
  def change
  	remove_column :tasks, :deadline
  	remove_column :tasks, :published_at
  	rename_column :assignments, :published_at, :assigned_at
  	add_index :tasks, :project_id
  end
end
