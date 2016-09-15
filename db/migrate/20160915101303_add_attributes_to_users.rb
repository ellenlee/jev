class AddAttributesToUsers < ActiveRecord::Migration[5.0]
  def change

  	# 基本個人資料
  	add_column :users, :name, :string, :default => "", :null => false
  	add_column :users, :phone, :string
  	add_column :users, :school, :string
  	add_column :users, :major, :string
  	add_column :users, :grade, :string
  	add_column :users, :birth, :date
  	add_column :users, :bio, :text

  	#課程關聯資料
  	add_column :users, :finish_projects, :integer, :default => 0
		add_column :users, :finish_tasks, :integer, :default => 0
		add_column :users, :attend_units, :integer, :default => 0

		#關聯資料
		add_column :users, :school_id, :integer
  end
end
