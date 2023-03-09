class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates [:artist_id, :title], uniqueness: true

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User,
  primary_key: :id
  
  belongs_to :shares,
  foreign_key: :viewer_id,
  class_name: :User,
  primary_key: :id
end


 