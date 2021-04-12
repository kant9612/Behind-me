class ListsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  # インスタンス変数に空のインスタンスを渡して、リストの投稿ができるようにする
  def new
    @list = List.new
    @movies = @list.movies.build #cocoonでlistを保存する時moviesも同時保存するため
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      flash[:notice] = "新しい映画リストが追加されました！"
      redirect_to lists_path
    else
      render :new
    end
  end

  def index
    @lists = List.all.page(params[:page]).per(8) #1ページあたり8つまで表示しページネーション
    @categories = Category.all #カテゴリー検索できるようにview画面左側にカテゴリーリストを表示
  end

  def show
    @list = List.find(params[:id])
    @movie = Movie.new
    @list_comment = ListComment.new
    @review = Review.new
  end

  def edit
    @list = List.find(params[:id])
    @movie = Movie.new
    if @list.user_id != current_user.id
      redirect_to lists_path
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
  		redirect_to list_path(@list)
    else
  	  render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    # 1つの映画リストに対してカテゴリーが1つに限らない
    params.require(:list).permit(:image, :list_title, :description, category_ids: [], movies_attributes: [:id, :title, :impression, :list_id, :user_id])
  end

  def ensure_correct_user
    @list = List.find(params[:id])
    unless @list.user == current_user
      redirect_to lists_path
    end
  end

end
