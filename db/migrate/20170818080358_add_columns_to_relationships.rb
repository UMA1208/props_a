class AddColumnsToRelationships < ActiveRecord::Migration
  def change
    # relationshipsテーブルにカラム入れるの忘れてた。。。笑
    add_column :relationships, :follower_id, :integer
    add_column :relationships, :following_id, :integer
  end
end
