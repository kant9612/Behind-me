class MoviesController < ApplicationController
  before_action :authenticate_user!

  def create
    @list = List.find(params[:list_id])
		@movie = Movie.new(movie_params)
		@movie.user = current_user
		@movie.save
		redirect_to edit_list_path(@list)
  end

  def destroy
    @list = List.find(params[:list_id])
		@movie = @list.movies.find(params[:id])
		@movie.destroy
		redirect_to request.referer
  end

  private
	def movie_params
		params.require(:movie).permit(:title, :list_id)
	end
end
