class UpdateUserAttr < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :email, :string, unique: true 
		change_column :statuses, :name, :string, unique: true
  	change_column :groups, :name, :string, unique: true 
		change_column :projects, :name, :string, unique: true
		change_column :user_teamships, :has_quit?, :boolean, default: false  
  
		add_column	:users, :created_by, :integer
		add_column	:users, :self_login?, :boolean, default: false
		add_column	:users, :first_login_on, :date
  end
end
