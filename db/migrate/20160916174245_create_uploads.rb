class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|

    	t.integer	:task_id
    	t.integer	:user_id
      t.timestamps
    end
    add_index :uploads, :task_id
    add_index :uploads, :user_id
  end
end
