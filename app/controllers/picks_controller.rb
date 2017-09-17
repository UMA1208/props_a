class PicksController < ApplicationController

  def index
    @picks = Pick.includes(:user).page(params[:page]).per(12).order("created_at DESC")
    @q = Pick.ransack(params[:q])
    @articles = @q.result(distinct: true).page(params[:page]).per(7).order("created_at DESC")
    @songs
  end

  def user_params
    params.require(:user).permit(:name, :tag_list)
  end

  def new
    @pick =Pick.new
  end

  def create
    link = params[:pick].require(:url)
    get_product(link).save
  end

  def get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.title
    # KAI-YOU
    if page.at('.m-article-main img')
      image_url = page.at('.m-article-main img')[:src]
      pick = Pick.new(title: title, image_url: image_url, user_id: current_user.id, url: params[:url], url: params[:pick].require(:url), tag_list: params[:pick].require(:tag_list), poster_comment: params[:pick].require(:poster_comment))
    # YOUTUBE
    elsif page.at('meta[itemprop="videoId"]')
      video_url = page.at('meta[itemprop="videoId"]')[:content]
      image_url = "http://i.ytimg.com/vi/#{video_url}/mqdefault.jpg"

      pick = Pick.new(title: title, image_url: image_url, user_id: current_user.id, url: params[:url], url: params[:pick].require(:url), tag_list: params[:pick].require(:tag_list), video_url: video_url, poster_comment: params[:pick].require(:poster_comment))
      # CAMPFIRE
    elsif page.at('.thumbnail-in img')
      image_url = page.at('.thumbnail-in img')[:src]
      project_url = page.at('.embed-popup-iframe iframe')[:src]
      pick = Pick.new(title: title, image_url: image_url, user_id: current_user.id, url: params[:url], url: params[:pick].require(:url), tag_list: params[:pick].require(:tag_list), project_url: project_url, poster_comment: params[:pick].require(:poster_comment))
    else
      redirect_to root_path
    end
 
  end

  def show
    @pick = Pick.find(params[:id])
    @comments = @pick.comments.includes(:user)
  end


end
