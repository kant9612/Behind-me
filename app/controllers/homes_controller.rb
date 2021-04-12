class HomesController < ApplicationController
  def top
    # likeが多い順にlistをsort
    @lists = List.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}
    # sortしたもののトップ8を1ページ目に表示
    # ページネーションを実装
    @lists = Kaminari.paginate_array(@lists).page(params[:page]).per(8)
  end

  def about
  end
end
