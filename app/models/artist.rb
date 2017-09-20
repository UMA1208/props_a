class Artist < ActiveRecord::Base
  has_many :favoriting_artists, class_name: "Favorite", foreign_key: "artist_id", dependent: :destroy
  has_many :users, through: :favoriting_artists
end
