class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
    	t.string			:name
      t.timestamps
    end
    add_index	 :groups, :name, unique: true
    add_column :teams, :group_id, :integer
    add_index	 :teams, :group_id
  	add_column :stages, :group_id, :integer
  	add_index  :stages, :group_id
  end
end
