class MoviesController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
		@movie = Movie.new(movie_params)
		@movie.list_id = @list.id
		@movie.user_id = current_user.id
		@movie.save
		redirect_to request.referer
  end

  def destroy
    @list = List.find(params[:list_id])
		@movie = @list.movie.find(params[:id])
		@movie.destroy
		redirect_to request.referer
  end

  private
	def movie_params
		params.require(:movie).permit(:title)
	end
end
