class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|

    	t.string			:name
    	t.string			:semester

      t.timestamps
    end
  end
end
