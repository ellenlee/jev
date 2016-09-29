class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
    	t.string		:name
    	t.integer		:stage_id
    	t.integer		:group_id
    	t.datetime	:published_at
    	t.index			:stage_id
    	t.index		:group_id
      t.timestamps
    end
    remove_column :stages, :group_id
    remove_column :stages, :published_at
  end
end
