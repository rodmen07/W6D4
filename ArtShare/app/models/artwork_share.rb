class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true

  belongs_to :artwork,
  foreign_key: :artwork_id,
  class_name: :Artwork,
  primary_key: :id


  belongs_to :viewer,
  foreign_key: :viewer_id,
  class_name: :User,
  primary_key: :id

  has_many :shared_viewers,
  through: :artwork,
  source: :shares
  
  
end


