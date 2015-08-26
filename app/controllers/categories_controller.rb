class CategoriesController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

	def index 
		@categories = Category.all
	end 
	
	def new
		@category = Category.new
	end 

	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to :categories
		else
			render :new
		end 
	end 

	def edit
		@category = Category.find(params[:id])
	end 

	def update
		@category = Category.find(params[:id])
		@category.attributes = params[:category]
		if @category.save
			redirect_to :categories
		else
			render :edit
		end 
	end 

	def destroy
		@cateogry = Category.find(params[:id])
		@cateogry.destroy
		redirect_to :back
	end 


	private
	def record_not_found(exception)
		case params[:action]
		when "destroy"
			redirect_to :categories
		else
			render_404(exception)
		end 
	end 
	
end
