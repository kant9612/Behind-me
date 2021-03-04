class ListsController < ApplicationController
  # インスタンス変数に空のインスタンスを渡して、リストの投稿ができるようにする
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.save
    redirect_to lists_path
  end

  def index
    @lists = List.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def list_params
    params.require(:list).permit(:image, :list_title, :list)
  end
end
