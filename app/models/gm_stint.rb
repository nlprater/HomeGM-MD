class GmStint < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :team
  belongs_to :draft
  has_many :selections

  validates :team_id, presence: true
  validates :draft_id, presence: true

end
