class User < ActiveRecord::Base
  has_secure_password

  has_many :created_drafts, class_name: "Draft", foreign_key: "creator_id"
  has_many :selections
  has_many :draft_participations, through: :selections, source: :draft
  has_many :gm_stints

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
end
