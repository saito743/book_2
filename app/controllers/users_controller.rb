class UsersController < ApplicationController
before_action :authenticate_user!

	def show
		@book = Book.new(user_id = @current_user)
		@user = User.find(params[:id])
		@books = @user.books
	end

	def edit
		@user = User.find(params[:id])
		if @user.id == current_user.id
            render "edit"
          else
            redirect_to user_path(current_user.id)
          end
	end

	def update
		@user = User.find(params[:id])
		if  @user.update(user_params)
		    redirect_to user_path(@user.id)
		    flash[:notice] = "You have updated user successfully."
		else
			render 'edit'
		end
	end

	def index
		@book = Book.new(params[:id])
		@users = User.all
		@user = User.find(current_user.id)
	end
private
  def user_params
  	params.require(:user).permit(:name,:introduction,:profile_image)
  end

end
