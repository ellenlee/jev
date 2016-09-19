class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
			t.string	:name
			t.text		:info
			t.date		:start_date
			t.date 		:end_date   
      t.timestamps
    end
    add_column :stages, :project_id, :integer
  	add_index	 :stages, :project_id
  end
end
