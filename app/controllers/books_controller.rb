class BooksController < ApplicationController
	def index
		@books = Book.where(checked_out: false)
	end 

	def show
		@book = Book.find(params[:id])
	end 

	def new
		@book = Book.new
	end 

	def edit
		@book = Book.find(params[:id])
	end 

	def update
		@book = Book.find(params[:id])
		@book.update_attributes(params[:book])
		redirect_to @book
	end 

	def destroy
	end 

	def create
		@book = Book.create(params[:book])
		redirect_to @book
	end 

end