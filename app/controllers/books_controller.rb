class BooksController < ApplicationController

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if  @book.save
			@user = @book.user
		    redirect_to book_path(@book.id)
		    flash[:complete] = "Book was successfully created."
		else
			render 'new'
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
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.user_id = current_user.id
		if  @book.update(book_params)
			redirect_to books_path
		    flash[:complete] = "Book was successfully created."
		 else
		 	render 'edit'
		 end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to users_path
		flash[:delete] = "Book was successfully destroyed."
	end
private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
