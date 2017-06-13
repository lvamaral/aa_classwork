class Artwork < ApplicationRecord
  validates :image_url, presence: true, uniqueness: true
  validates  :title, uniqueness: {scope: :artist_id}

  belongs_to :artist,
  primary_key: :id,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_shares,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare

  has_many :shared_viewers,
  through: :artwork_shares,
  source: :viewer

  def self.artworks_for_user_id(user_id)
    joins_condition = <<-SQL
      LEFT OUTER JOIN
        artwork_shares ON artworks.id = artwork_shares.artwork_id
    SQL
    where_condition = <<-SQL
      ((artworks.artist_id = :user_id) OR (artwork_shares.viewer_id = :user_id))
    SQL

    Artwork
      .joins(joins_condition)
      .where(where_condition, user_id: user_id)
      .uniq
  end
end
