class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
    	t.integer     :num
    	t.string			:name
    	t.text				:info
    	t.datetime		:published_at
      t.timestamps
      t.index       :num
    end
  end
end
