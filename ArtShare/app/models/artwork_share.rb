class ArtworkShare < ApplicationRecord
  validates [:artwork_id, :viewer_id], presence: true, unique:true

  belongs_to :artwork
  belongs_to :viewer

end
