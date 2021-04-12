class ReviewsController < ApplicationController
  before_action :authenticate_user!

	def create
		@list = List.find(params[:list_id])
		@review = Review.new(review_params)
		@review.list_id = @list.id
		@review.user_id = current_user.id
		@review.save
  		redirect_to list_path(@list.id)
	end

	def destroy
		@list = List.find(params[:list_id])
		@review = @list.reviews.find(params[:id])
		@review.destroy
			redirect_to request.referer
	end

	private

	def review_params
		params.require(:review).permit(:comment, :rate)
	end

end
