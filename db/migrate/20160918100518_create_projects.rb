class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
			t.string	:name, unique: true
			t.text		:info
			t.date		:start_on
			t.date 		:close_on
      t.integer :creator_id
      t.timestamps
    end
    add_column :stages, :project_id, :integer
  	add_index	 :stages, :project_id
  end
end
