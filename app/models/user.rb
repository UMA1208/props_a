class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments
  has_many :picks

 has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

 has_many :followings, through: :following_relationships

 has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

 has_many :followers, through: :follower_relationships

 has_many :favorite_artists, class_name: "Favorite", foreign_key: "user_id", dependent: :destroy

 has_many :artists, through: :favorite_artists

 def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def favorite?(artist)
    favorite_artists.find_by(artist_id: artist.id)
  end
end
