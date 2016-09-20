class AddUserGroupRelation < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :group_id
    add_column	:user_teamships, :group_id, :integer
  	add_index	:user_teamships, :group_id
  end
end
