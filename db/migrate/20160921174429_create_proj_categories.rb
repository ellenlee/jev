class CreateProjCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :proj_categories do |t|
    	t.string :name
      t.timestamps
    end
    add_index  :proj_categories, :name, unique: true

    add_column :projects, :category_id, :integer, default: 1
    add_index  :projects, :category_id
  end
end
