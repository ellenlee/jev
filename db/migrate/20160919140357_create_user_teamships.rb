class CreateUserTeamships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_teamships do |t|
    	t.integer	:user_id
    	t.integer	:team_id
    	t.boolean	:has_quit?, :default => true
    	t.date    :quit_date
      t.timestamps
    end
    add_index	:user_teamships, :user_id
    add_index	:user_teamships, :team_id
  end
end
