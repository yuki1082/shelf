class BooksController < ApplicationController
	def index
		@books = Book.checked_in
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
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to :back
	end 

	def create
		@book = Book.create(params[:book])
		redirect_to @book
	end 

	def check_out
		@book = Book.find(params[:id])
		@book.update_attribute(:checked_out, true)
		redirect_to :back
	end 

	def check_in
		@book = Book.find(params[:id])
		@book.update_attribute(:checked_out, false)
		redirect_to :back
	end 
	
	def checked_out
		@books = Book.checked_out
		render :index
	end 

	def search
		@books = Book.order(:id)
		@books = @books.search(params[:q]) if params[:q].present?
		render :index
	end 


end
