class LikesController < ApplicationController
  before_action :set_list
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    like = @list.likes.new(user_id: current_user.id)
    like.save
  end

  def destroy
    @list = List.find(params[:list_id])
    like = @list.likes.find_by(user_id: current_user.id)
    like.destroy
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end
end
