class User < ActiveRecord::Base
  has_secure_password

  has_many :created_drafts, class_name: "Draft", foreign_key: "creator_id"
  has_many :selections
  has_many :draft_participations, through: :selections, source: :draft

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password_digest, presence: true
  
end
