class Artist < ActiveRecord::Base

  has_many :songs
  def self.search(search)
      where("name ILIKE ?", "%#{search}%")
    end
end
