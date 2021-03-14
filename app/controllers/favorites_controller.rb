class FavoritesController < ApplicationController
  before_action :set_list
  before_action :authenticate_user! # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  def create
    @list = List.find(params[:list_id])
    favorite = @list.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @list = List.find(params[:list_id])
    favorite = @list.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end
end
