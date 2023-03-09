class User < ApplicationRecord
    validates: :username, presence: true, uniqueness: true

  has_many :views,
  foreign_key: :viewer_id,
  class_name: :User,
  primary_key: :id

  has_many :artworks,
  foreign_key: :artist_id,
  class_name: :User,
  primary_key: :id

  has_many :shared_artworks
  
  
end
 