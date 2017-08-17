class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.string  :title
      t.text    :image_url
      t.integer :user_id
      t.text    :url
      t.text    :video_url
      t.text    :project_url
      t.timestamps null: false
    end
  end
end
