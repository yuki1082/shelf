class BooksController < ApplicationController
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @books = @category.books.checked_in
    else
      @books = Book.checked_in
    end
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
    if @book.update_attributes(params[:book])
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :back
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to @book
    else
      render :new
    end
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
  	if params[:category_id]
  		@category = Category.find(params[:category_id])
  		@books = @category.books.checked_out
  	else
  		@books = Book.checked_out
  	end 
  	render :index
  end

  def search
    @books = Book.order(:id)
    @books = @books.search(params[:q]) if params[:q].present?
    render :index
  end


end
