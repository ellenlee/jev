class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
    	t.integer		:num
    	t.integer		:project_id
    	t.integer		:group_id
      t.timestamps
    end
    add_index	:teams, :project_id
   	add_index	:teams, :group_id
  end
end
