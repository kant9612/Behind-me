class UsersController < ApplicationController

  def index
    @user = User.all
    @users = User.all
  end

  def show

  end

  def edit
  end

  def update
  end

end
