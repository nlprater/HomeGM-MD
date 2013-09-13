class CreateTeams < ActiveRecord::Migration
  def change
  	create_table :teams do |t|
  	  t.string :name
  	  t.string :division
  	  t.string :conference
  	  t.string :location

  	  t.timestamps
  	end
  end
end
