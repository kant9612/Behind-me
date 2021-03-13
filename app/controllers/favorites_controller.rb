class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    favorite = @list.favorites.new(user_id: current_user.id)
    favorite.save
    # redirect_to request.referer
  end

  def destroy
    @list = List.find(params[:list_id])
    favorite = @list.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    # redirect_to request.referer
  end
end
