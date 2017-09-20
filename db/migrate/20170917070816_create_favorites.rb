class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, null: false
      t.references :artist, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
