class ProductsController < ApplicationController
    #before_action :authenticate_member!,only: [:show]

	def index
		@genres = Genre.all
		@genre = Genre.where(is_valid: true)
		if params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			@products = Product.where(genre_id: @genre.id).page(params[:page]).per(8)
			@title = Genre.find(params[:genre_id]).name
			@counts = Product.where(genre_id: @genre.id).count
	    else
	        @products = Product.page(params[:page]).per(8)
	        @title = "商品"
	        @counts = Product.count
	    end
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
	end

end
