class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@books = @user.books
		@book = Book.new(user_id = @current_user)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@user.id)
		flash[:notice] = "You have updated user successfully."
	end

	def index
		@users = User.all
		@user = User.find(current_user.id)
		@book = Book.new(params[:id])
	end
private
  def user_params
  	params.require(:user).permit(:name,:introduction,:profile_image)
  end
end
