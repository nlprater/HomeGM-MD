class Round < ActiveRecord::Base
 
  has_many :selections
  has_many :draft_positions
  belongs_to :draft
end
