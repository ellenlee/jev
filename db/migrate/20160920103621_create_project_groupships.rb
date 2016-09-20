class CreateProjectGroupships < ActiveRecord::Migration[5.0]
  def change
    create_table :project_groupships do |t|

    	t.integer	:project_id
    	t.integer	:team_id

      t.timestamps
    end
    add_index :project_groupships, :project_id
    add_index :project_groupships, :team_id

    remove_column :teams, :project_id
    
  end
end