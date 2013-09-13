class Selection < ActiveRecord::Base
  belongs_to :draft
  belongs_to :user 
  belongs_to :team	
  belongs_to :round
  belongs_to :player
  belongs_to :draft_position

end
