class ListCommentsController < ApplicationController
  before_action :authenticate_user!

	def create
		@list = List.find(params[:list_id])
		@list_comment = ListComment.new(list_comment_params)
		@list_comment.list_id = @list.id
		@list_comment.user_id = current_user.id
		@list_comment.save
		#非同期通信でview/list_comments/create.js.erbを読み込みに行く
	end

	def destroy
		@list = List.find(params[:list_id])
		@list_comment = @list.list_comments.find(params[:id])
		@list_comment.destroy
		#非同期通信でview/list_comments/destroy.js.erbファイルを読み込みに行く
	end

	private

	def list_comment_params
		params.require(:list_comment).permit(:comment)
	end
end
