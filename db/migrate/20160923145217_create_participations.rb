class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|	
    	t.integer	:project_id
    	t.integer  :group_id
      t.integer	:user_id
    	t.index		[:project_id, :user_id], unique: true
    	t.index		:project_id
    	t.index		:user_id
    	t.index		:group_id
      t.timestamps
    end
  end
end
