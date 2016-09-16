class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
    	t.integer			:stage_id
    	t.string			:title
    	t.boolean			:team_work?
      t.timestamps
    end
    add_index	:tasks, :stage_id
  end
end
