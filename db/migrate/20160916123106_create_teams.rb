class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|

    	t.integer	:classroom_id
    	t.integer	:num
    	t.string	:name

      t.timestamps
    end
    add_index	:teams, :classroom_id
  end
end
