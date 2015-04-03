class Api::FeedsController < ApplicationController
  def index
    if logged_in?
      render :json => current_user.feeds
    else
      render :json => nil
    end
  end

  def show
    render :json => Feed.find(params[:id]), include: :latest_entries#, include: :favorited
  end

  def create
    feed = Feed.find_or_create_by_url(feed_params[:url])
    if feed
      render :json => feed
    else
      render :json => { error: "invalid url" }, status: :unprocessable_entity
    end
  end

  def destroy
    feed = Feed.find(params[:id])
    feed.destroy!
    render :json => feed
  end

  private

  def feed_params
    params.require(:feed).permit(:title, :url)
  end
end
