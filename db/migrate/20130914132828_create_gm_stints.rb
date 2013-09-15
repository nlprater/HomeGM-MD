class CreateGmStints < ActiveRecord::Migration
  def change
  	create_table :gm_stints do |t|
      t.belongs_to :user
      t.belongs_to :team
      t.belongs_to :draft

      t.timestamps
  	end
  end
end
