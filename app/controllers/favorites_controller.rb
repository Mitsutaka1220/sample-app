class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:to_micropost_id])
    current_user.favorite(@micropost)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    @micropost = Favorite.find(params[:id]).to_micropost
    current_user.cancel_favorite(@micropost)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
end
