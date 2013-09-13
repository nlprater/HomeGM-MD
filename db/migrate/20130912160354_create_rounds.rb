class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
  	  t.belongs_to :draft
  	  t.integer :draft_round_number

  	  t.timestamps
  	end
  end
end
