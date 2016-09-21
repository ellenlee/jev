class CreateProjCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :proj_categories do |t|
    	t.string :name, unique: true
      t.timestamps
    end
    change_column :projects, :proj_category_id, :integer, default: 1
    add_index  :projects, :proj_category_id
  end
end
