class AuthorsController < ApplicationController
	before_action :current_author, only: [:show, :update]

	def index
		@authors = Author.all
	end

	def new
		@author = Author.new
	end
	def show
		@author = Author.find(params[:id])
		@author_books = @author.books.pluck(:book_title)
	end

	def create
		author = Author.create(author_params)
		redirect_to author_path(author)
	end

	def update
		@author.update(author_params)
		redirect_to author_path(@author)
	end

	 def edit
    	@author = Author.find(params[:id])
  	end

	def destroy
		Author.find(params[:id]).destroy
		redirect_to action: "index"
	end

	private

	def author_params
		params.require(:author).permit(:first_name, :last_name, :date_of_birth)
	end

	def current_author
    	@author = Author.find(params[:id])
  	end
end
