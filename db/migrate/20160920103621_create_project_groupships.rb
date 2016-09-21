class CreateProjectGroupships < ActiveRecord::Migration[5.0]
  def change
    create_table :project_groupships do |t|

    	t.integer	:project_id
    	t.integer	:group_id

      t.timestamps
    end
    add_index :project_groupships, :project_id
    add_index :project_groupships, :group_id
  end
end
