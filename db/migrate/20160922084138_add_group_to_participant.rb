class AddGroupToParticipant < ActiveRecord::Migration[5.0]
  def change
  	add_column	:participants, :group_id, :integer
  	add_index		:participants, [:project_id, :group_id]
  	add_index		:participants, :group_id
  end
end
