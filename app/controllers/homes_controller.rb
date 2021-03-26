class HomesController < ApplicationController
  def top
    @lists = List.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    @lists = Kaminari.paginate_array(@lists).page(params[:page]).per(8)
    # @list.user_id = current_user.id
  end
  def about
  end
end
