class Admins::ProductsController < ApplicationController
	before_action :authenticate_admin!

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.save!
		redirect_to admins_product_path(@product.id)
	end

	def index
		@products = Product.all.page(params[:page]).per(10)
		# 1ページに10のレコードを取り出す処理
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
		redirect_to admins_product_path(@product.id) #パス先変更
	end

    private
	def product_params
		params.require(:product).permit(:image, :name, :introduction, :genre_id, :price, :is_sale)
	end
end
