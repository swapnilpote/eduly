class CategoriesController < ApplicationController

	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.all
	end

	def show
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to @category, notice: 'New category has been created successfully.'
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @category.update(category_params)
			redirect_to @category, notice: 'Category has been updated successfully.'
		else
			render 'edit'
		end
	end

	def destroy
		@category.destroy
		redirect_to categories_path, notice: 'Category has been deleted successfully.'
	end


	private
		def category_params
			params.require(:category).permit(:category_title, :category_description)
		end

		def set_category
			@category = Category.find(params[:id])
		end
end
