class CreatePartiStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :parti_statuses do |t|
    	t.string	:name
    	t.index		:name, unique: true
      t.timestamps
    end
    add_column :participations, :status_id, :integer, default: 1
    add_index  :participations, :status_id
  end
end
