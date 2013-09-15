class CreateTeams < ActiveRecord::Migration
  def change
  	create_table :teams do |t|
  	  t.string :name
  	  t.string :division
  	  t.string :conference
  	  t.string :city
  	  t.string :state

  	  t.timestamps
  	end
  end
end
