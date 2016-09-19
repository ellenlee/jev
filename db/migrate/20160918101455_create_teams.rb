class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
    	t.integer		:num
      t.timestamps
    end
  end
end
