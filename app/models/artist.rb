class Artist < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
