class AddPosterCommentToPicks < ActiveRecord::Migration
  def change
    add_column :picks, :poster_comment, :string
  end
end
