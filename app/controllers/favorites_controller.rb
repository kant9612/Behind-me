class FavoritesController < ApplicationController
  before_action :set_list
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    favorite = @list.favorites.new(user_id: current_user.id)
    favorite.save
    #非同期通信でview/favorites/create.js.erbを読み込みに行く
  end

  def destroy
    @list = List.find(params[:list_id])
    favorite = @list.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    #非同期通信でview/favorites/destroy.js.erbを読み込みに行く
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end
end
