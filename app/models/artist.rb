class Artist < ActiveRecord::Base
mount_uploader :image, ImageUploader
  has_many :songs
  def self.search(search)
      where("name ILIKE ?", "%#{search}%")
    end
end
