class Draft < ActiveRecord::Base
  
  has_one  :creator, class_name: "User", foreign_key: "id"
  has_many :rounds
  has_many :selections
  has_many :participants, through: :selections, source: :user
  has_many :players, through: :selections, source: :player
  has_many :teams, through: :selections, source: :team

end
