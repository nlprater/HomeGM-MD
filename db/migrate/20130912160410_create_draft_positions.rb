class CreateDraftPositions < ActiveRecord::Migration
  def change
  	create_table :draft_positions do |t|
  	  t.belongs_to :team
      t.belongs_to :round
      t.integer :position

  	  t.timestamps
  	end
  end
end
