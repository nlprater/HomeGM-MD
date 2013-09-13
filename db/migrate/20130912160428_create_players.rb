class CreatePlayers < ActiveRecord::Migration
  def change
  	create_table :players do |t|
  	  t.string :full_name
  	  t.string :position
  	  t.string :college_year
  	  t.string :college

  	  t.timestamps
  	end
  end
end
