class ReviseColumnOfStages < ActiveRecord::Migration[5.0]
  def change
  	add_column :stages, :group_id, :integer
  	add_index	 :stages, :group_id
  	add_column	 :stages, :published_at, :datetime
  end
end
