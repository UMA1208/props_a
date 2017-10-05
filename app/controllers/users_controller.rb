class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @nickname= @user.nickname
    @picks= @user.picks
    @user_image = @user.icon_image
    @header_image = @user.header
    @favorite_artists = @user.artists
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def edit_profile
    @q = Artist.ransack(params[:q])
    @searched_artists = @q.result(distinct: true)
  end

end
