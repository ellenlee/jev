class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
    	t.integer		:stage_id
    	t.integer 	:task_id
    	t.datetime	:deadline
    	t.datetime	:published_at
    	t.boolean   :team_work, default: true
    	t.index			:stage_id
    	t.index			:task_id
      t.timestamps
    end
    remove_column :tasks, :stage_id
    add_column    :tasks, :project_id, :integer
  end
end
