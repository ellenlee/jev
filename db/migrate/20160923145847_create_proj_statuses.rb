class CreateProjStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :proj_statuses do |t|
    	t.string	:name
    	t.index		:name, unique: true
      t.timestamps
    end
    add_column :projects, :status_id, :integer, default: 3
    add_index  :projects, :status_id
  end
end
