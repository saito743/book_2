class BooksController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: [:edit,:update]

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			# @user = @book.user
		    redirect_to book_path(@book.id)
		    flash[:notice] = "Book was successfully created."
		else
			# @user = User.find(current_user.id)
			@books = Book.all
			render 'index'
		end
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = User.find(current_user.id)
	end

	def show
		@books = Book.new
		@book = Book.find(params[:id])
		@user = @book.user
	end

	def edit
	end

	def update
		@book.user_id = current_user.id
		if  @book.update(book_params)
			redirect_to book_path(@book.id)
		    flash[:notice] = "Book was successfully created."
		 else
		 	render 'edit'
		 end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to users_path
		flash[:notice] = "Book was successfully destroyed."
	end

	def correct_user
      @book = Book.find(params[:id])
      redirect_to(books_url) unless @book.user == current_user
    end
private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
