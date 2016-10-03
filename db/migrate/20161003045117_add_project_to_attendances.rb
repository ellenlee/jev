class AddProjectToAttendances < ActiveRecord::Migration[5.0]
  def change
  	add_column :attendances, :project_id, :integer
  	add_index  :attendances, :project_id
  end
end
