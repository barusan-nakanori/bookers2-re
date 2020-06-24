class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  end

  def create
  	@book = Book.new(params_book)
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
