class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
    	t.integer :project_id
    	t.integer	:classroom_id
    	t.integer	:team_id
    	t.integer :user_id

      t.timestamps
    end
    add_index	:participants, :project_id
    add_index	:participants, :classroom_id
    add_index	:participants, :team_id
    add_index	:participants, :user_id
  end
end
