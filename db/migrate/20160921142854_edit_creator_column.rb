class EditCreatorColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :projects, :creator, :creator_id
  end
end
