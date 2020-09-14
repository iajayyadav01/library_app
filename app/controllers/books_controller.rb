class BooksController < ApplicationController
	before_action :current_book, only: [:show, :update]

	def index
		@books = Book.all
	end

	def new
		@book = Book.new
	end
	def show
		@book = Book.find(params[:id])
	end

	def create
		book = Book.create(book_params)
		if book.present?
			@authors_list.each do |author|
				AuthorBook.create(author_id: author.to_i, book_id: book.id)
			end
		end
		redirect_to book_path(book)
	end

	def update
		@book.update(book_params)
		author_book_previous = AuthorBook.where('book_id = ?', @book.id)
		author_book_previous.destroy_all
		@authors_list.each do |author|
			AuthorBook.create(author_id: author.to_i, book_id: @book.id)
		end
		redirect_to book_path(@book)
	end

	 def edit
    	@book = Book.find(params[:id])
  	end

	def destroy
		Book.find(params[:id]).destroy
		redirect_to action: "index"
	end

	private

	def book_params
		@authors_list = params["book"]["author"]
		params.require(:book).permit(:book_title)
	end

	def current_book
    	@book = Book.find_by(params[:id]) 
  	end
end
