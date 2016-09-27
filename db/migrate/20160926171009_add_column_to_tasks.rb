class AddColumnToTasks < ActiveRecord::Migration[5.0]
  def change
  	add_column :tasks, :published_at, :datetime
  	add_column :tasks, :deadline, :datetime
  	add_index :stages, :num
  	add_column :uploads, :status_id, :integer
  	add_index	:uploads, :status_id
  end
end
