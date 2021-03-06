class UsersController < ApplicationController
before_action :authenticate_user!
before_action :baria_user, only: [:edit]

  def index
  	@users = User.all
  	@book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  		flash[:notice] = "You have updated user successfully."
  		redirect_to user_path(@user)
  	else
  		render 'edit'
  	end
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = Book.where(user_id:@user.id)
  end

	  private
	  def user_params
	  	params.require(:user).permit(:name,:introduction,:profile_image)
	  end

    def baria_user
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to user_path(current_user)
      end
    end
end
