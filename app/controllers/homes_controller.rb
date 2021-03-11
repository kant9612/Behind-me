class HomesController < ApplicationController
  def top
    @lists = List.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    # @list.user_id = current_user.id
  end
  def about
  end
end
