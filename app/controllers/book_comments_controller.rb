class BookCommentsController < ApplicationController

	# def create 修正用
	# 	@comment = BookComment.new(comment_params)
	# 	@comment.user_id = current_user.id
	# 	if @comment.save
	# 		redirect_back(fallback_location: root_path)
	# 	else
	# 		redirect_back(fallback_location: root_path)
	# 	end
	# end

	def create
		@book = Book.find(params[:book_id])
		@comment = @book.book_comments.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to book_path(@comment.book)
		else
    		@comments = @book.book_comments
			render 'books/show'
		end
	end

	def destroy
		@comment = BookComment.find(book_id: params[:book_id])
		@comment.destroy
		redirect_to book_path(@comment.book)
	end

		private
		# def comment_params　修正用
		# 	params.require(:book_comment).permit(:content,:book_id)
		# end

		def comment_params
			params.require(:book_comment).permit(:content)
		end
end
