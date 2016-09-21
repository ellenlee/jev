class CreateProjStats < ActiveRecord::Migration[5.0]
  def change
    create_table :proj_stats do |t|
    	t.string	:name, unique: true
      t.timestamps
    end
    add_column	:projects, :proj_stat_id, :integer, :default => 1
    add_index		:projects, :proj_stat_id
  end
end
