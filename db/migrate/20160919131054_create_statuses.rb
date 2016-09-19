class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
    	t.string	:name
      t.timestamps
    end
    add_column	:projects, :status_id, :integer, :default => 1
    add_index	:projects, :status_id
  end
end
