class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
    like = @list.likes.new(user_id: current_user.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    @list = List.find(params[:list_id])
    like = @list.likes.find_by(user_id: current_user.id)
    like.destroy
    redirect_to request.referer
  end
end
