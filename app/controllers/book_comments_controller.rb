class BookCommentsController < ApplicationController

	def create
		@comment = Book_comment.new(comment_params)
		@comment.user_id = current_user.id

	end

	def destroy

	end

		private
		def comment_params
			params.require(:book_comment).permit(:content)
		end
end
