class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
    	t.integer		:classroom_id
    	t.integer		:project_id
    	t.integer		:num
    	t.string		:name
      t.timestamps
    end
  end
end
