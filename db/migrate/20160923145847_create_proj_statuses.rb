class CreateProjStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :proj_statuses do |t|
    	t.string	:name
      t.timestamps
    end
  end
end
