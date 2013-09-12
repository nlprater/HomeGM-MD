class Photo < ActiveRecord::Base
  mount_uploader :file, Uploader
  has_one :user
end
