class RemoveStageName < ActiveRecord::Migration[5.0]
  def change
  	remove_column :stages, :name
  	add_column :lessons, :num, :integer
  	add_index	 :lessons, :num
  end
end
