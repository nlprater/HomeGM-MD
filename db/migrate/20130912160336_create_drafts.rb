class CreateDrafts < ActiveRecord::Migration
  def change
  	create_table :drafts do |t|
  	  t.integer :creator_id
  	  t.integer :number_of_games
  	  t.integer :number_of_rounds
  	  t.string  :access
  	  t.string  :type

  	  t.timestamps
  	end
  end
end
