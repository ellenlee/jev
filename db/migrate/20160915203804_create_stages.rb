class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
    	t.string			:title
    	t.text				:info
    	t.integer			:project_id
      t.timestamps
    end
    add_index	:stages, :project_id
  end
end
