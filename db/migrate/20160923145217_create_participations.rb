class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|	
    	t.integer	:project_id
    	t.integer	:user_id
    	t.integer	:group_id
    	t.integer	:status_id, default: 1
    	t.index		[:project_id, :user_id]
    	t.index		:project_id
    	t.index		:user_id
    	t.index		:group_id
      t.timestamps
    end
    drop_table	:team_members
  	drop_table	:parti_stats
  	drop_table  :proj_stats
  end
end
