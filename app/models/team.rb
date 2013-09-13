class Team < ActiveRecord::Base
  
  has_many :draft_positions
  has_many :selections

end
