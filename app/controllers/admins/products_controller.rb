class Admins::ProductsController < ApplicationController
	# before_action :authenticate_user!
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save!
		redirect_to '/admin/products'
	end

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to '/admin/products'
	end

    private
	def product_params
		params.require(:product).permit(:image, :name, :introduction, :genre_id, :price, :is_sale)
	end
end
