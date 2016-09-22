class RenameStatusAndCategoryColumn < ActiveRecord::Migration[5.0]
  def change
  	rename_column :projects, :proj_category_id, :category_id
  	rename_column :projects, :proj_stat_id, :status_id
  	rename_column :participants, :parti_stat_id, :status_id
  end
end
