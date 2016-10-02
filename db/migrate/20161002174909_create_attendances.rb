class CreateAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :attendances do |t|
    	t.integer	:user_id
    	t.integer	:lesson_id
    	t.index   :user_id
    	t.index		:lesson_id
    	t.boolean	:attend
    	t.integer :status
      t.timestamps
    end
  end
end
