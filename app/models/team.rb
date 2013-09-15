class Team < ActiveRecord::Base
  
  has_many :draft_positions
  has_many :selections
  has_many :gm_stints

end
