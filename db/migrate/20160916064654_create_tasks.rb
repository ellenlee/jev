class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
    	t.integer			:stage_id
    	t.integer     :num
    	t.string			:name
    	t.boolean			:team_work?, :default => true
      t.timestamps
    end
    add_index	:tasks, :stage_id
  end
end
