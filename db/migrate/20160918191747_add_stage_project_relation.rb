class AddStageProjectRelation < ActiveRecord::Migration[5.0]
  def change
  	add_column :stages, :project_id, :integer
  	add_index	 :stages, :project_id
  	rename_column(:stages, :title, :name)

		add_column :tasks, :project_id, :integer
  	add_index	 :tasks, :project_id
  	rename_column(:tasks, :title, :name)

  	add_column :uploads, :project_id, :integer
  	add_index	 :uploads, :project_id
  end
end
