class AddSnToStage < ActiveRecord::Migration[5.0]
  def change
  	add_column	:stages, :num, :integer
  	
  end
end
