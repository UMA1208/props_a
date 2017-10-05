class FavoritesController < ApplicationController

  def create
    @user_id = current_user.id
    @artist_id = Artist.find(params[:favorite][:artist_id]).id
    @favorite = Favorite.new(user_id: @user_id, artist_id: @artist_id)

    if @favorite.save
      redirect_to user_edit_profile_path(current_user)
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    if @favorite.destroy
      redirect_to user_edit_profile_path(current_user)
    end
  end
end
