class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
  	@book = Book.new(params_book)
  	@book.user_id = current_user.id
  	if @book.save
  		redirect_to book_path(@book)
  	else
  		render 'index'
  	end
  end

  def edit
  end

	  private
	  def params_book
	  	params.require(:book).permit(:title,:body)
	  end
end
