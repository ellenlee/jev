class CreatePartiStats < ActiveRecord::Migration[5.0]
  def change
    create_table :parti_stats do |t|
    	t.string	:name, unique: true
      t.timestamps
    end
    add_column :participants, :parti_stat_id, :integer, default: 1
    add_index  :participants, :parti_stat_id
  end
end
