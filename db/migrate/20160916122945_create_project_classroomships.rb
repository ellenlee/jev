class CreateProjectClassroomships < ActiveRecord::Migration[5.0]
  def change
    create_table :project_classroomships do |t|

    	t.integer	:project_id
    	t.integer	:classroom_id

      t.timestamps
    end
    add_index	:project_classroomships, :project_id
    add_index	:project_classroomships, :classroom_id
  end
end
