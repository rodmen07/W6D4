# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness: { scope: :viewer_id }

  belongs_to :artwork,
  foreign_key: :artwork_id,
  class_name: :Artwork,
  primary_key: :id

  belongs_to :viewer,
  foreign_key: :viewer_id,
  class_name: :User,
  primary_key: :id
end
