class CreateTeamMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_memberships do |t|
    	t.integer	:user_id
    	t.integer :team_id
    	t.boolean :has_quit?,	 default: true
    	t.date		:quit_on

      t.timestamps
    end
    add_index	:team_memberships, :user_id
    add_index	:team_memberships, :team_id
  end
end
