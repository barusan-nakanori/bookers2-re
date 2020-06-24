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
  		@books = Book.all
  		render 'index'
  	end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(params_book)
  		redirect_to book_path(@book)
  	else
  		@book = Book.find(params[:id])
  		render 'edit'
  	end
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to user_path(book.user)
  end

	  private
	  def params_book
	  	params.require(:book).permit(:title,:body)
	  end
end
