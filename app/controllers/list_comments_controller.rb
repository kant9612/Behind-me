class ListCommentsController < ApplicationController
  before_action :authenticate_user!

	def create
		@list = List.find(params[:list_id])
		@list_comment = ListComment.new(list_comment_params)
		@list_comment.list_id = @list.id
		@list_comment.user_id = current_user.id
		@list_comment.save
		# if @list_comment.save
  # 		redirect_to list_path(@list.id)
		# else
		#   render 'lists/show'
		# end
		# 非同期にする際はview/bookcomments/create.js.erbを参照しにいく
	end

	def destroy
		@list = List.find(params[:list_id])
		@list_comment = @list.list_comments.find(params[:id])
		@list_comment.destroy
		# redirect_to request.referer
		# 非同期にする際はview/bookcomments/destroy.js.erbを参照しにいく
	end

	private

	def list_comment_params
		params.require(:list_comment).permit(:comment)
	end
end
