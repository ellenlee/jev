class AddOnTimeColumnToUpload < ActiveRecord::Migration[5.0]
  def change
  	add_column :uploads, :on_time, :boolean
  end
end
