class CreateTeammateships < ActiveRecord::Migration[5.0]
  def change
    create_table :teammateships do |t|
    	t.integer	:user_id
    	t.integer :team_id
    	t.boolean :active?,	 default: true
    	t.date		:quit_on
      t.timestamps
    end
    add_index	:teammateships, :user_id
    add_index	:teammateships, :team_id
  end
end
