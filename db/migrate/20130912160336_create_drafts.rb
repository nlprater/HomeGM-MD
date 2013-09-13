class CreateDrafts < ActiveRecord::Migration
  def change
  	create_table :drafts do |t|
  	  t.integer :creator_id

  	  t.timestamps
  	end
  end
end
