class DropTableParticipant < ActiveRecord::Migration[5.0]
  def change
  	drop_table :participants
  end
end
