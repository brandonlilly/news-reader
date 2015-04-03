class Api::FavoritesController < ApplicationController

  def create
    favoritable_id = params[:feed_id] || params[:entry_id]
    favoritable_type = params[:feed_id] ? Feed : Entry

    favorite = current_user.favorites.where(favoritable_type: favoritable_type.to_s).first

    if favorite
      favorite.destroy!
    else
      current_user.favorites.build(favoritable: favoritable_type.find(favoritable_id))
    end
    render json: favorite
  end

  def destroy

  end

end
