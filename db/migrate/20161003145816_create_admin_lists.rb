class CreateAdminLists < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_lists do |t|
    	t.string :email
    	t.index  :email, unique: true
      t.timestamps
    end
  end
end
