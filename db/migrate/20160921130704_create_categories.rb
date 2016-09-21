class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
    	t.string :name

      t.timestamps
    end
    add_column :projects, :category_id, :integer
    add_column :projects, :creator, :integer
    add_index :projects, :category_id
  end
end
