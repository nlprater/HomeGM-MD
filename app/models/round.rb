class Round < ActiveRecord::Base
 
  has_many :selections
  has_many :draft_positions
  belongs_to :draft

  validates :draft_round_number, presence: true

end
