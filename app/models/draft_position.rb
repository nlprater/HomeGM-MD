class DraftPosition < ActiveRecord::Base
  
  belongs_to :round
  has_one :selection
  belongs_to :team

end
