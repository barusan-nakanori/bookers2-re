class BooksController < ApplicationController
before_action :authenticate_user!
before_action :baria_book, only: [:edit]

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
    @comments = @book.book_comments
    @comment = Comment.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
      flash[:notice] = 'You have creatad book successfully.'
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
  	if @book.update(book_params)
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
	  def book_params
	  	params.require(:book).permit(:title,:body)
	  end

    def baria_book
      @book = Book.find(params[:id])
      unless @book.user == current_user
        redirect_to books_path
      end
    end
end
