class CreateTaskAchieved < ActiveRecord::Migration[5.0]
  def change
    create_table :task_achieved do |t|

    	t.integer		:task_id
    	t.integer		:team_id
    	t.integer		:user_id
    	t.string		:who_upload
    	t.datetime	:deadline
      t.timestamps
    end
    add_index	:task_achieved, :task_id
    add_index	:task_achieved, :team_id
    add_index	:task_achieved, :user_id
  end
end
