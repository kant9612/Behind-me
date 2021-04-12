class UsersController < ApplicationController

  def index
    @user = User.all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @lists = @user.lists.all.page(params[:page]).per(5)

    favorite = Favorite.where(user_id: current_user.id).pluck(:list_id) # ログイン中ユーザーのお気に入りのlist_idカラムを取得
    @favorite_list = List.find(favorite) # listsテーブルから、お気に入り登録済みのレコードを取得

    like = Like.where(user_id: current_user.id).pluck(:list_id) # ログイン中ユーザーのいいねのlist_idカラムを取得
    @like_list = List.find(like) # listsテーブルから、いいね登録済みのレコードを取得
  end

  def edit
    @user = User.find(params[:id])
     if @user.id !=current_user.id
       redirect_to user_path(current_user.id)
     end
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :action => "edit"
      end
  end

  private

   def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end

end
