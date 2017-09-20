class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.text :artist_url
      t.timestamps null: false
    end
  end
end
