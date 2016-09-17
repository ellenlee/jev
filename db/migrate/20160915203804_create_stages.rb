class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
    	t.string			:title
    	t.text				:info
      t.timestamps
    end
  end
end
