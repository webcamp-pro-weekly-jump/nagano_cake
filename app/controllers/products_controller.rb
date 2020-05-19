class ProductsController < ApplicationController
    before_action :authenticate_member!

	def index
		@genres = Genre.all
		@genre = Genre.where(is_valid: true)
		if params[:genre_id]
			@genre = Genre.find(params[:genre_id])
			@products = Product.where(genre_id: @genre.id)
			@title = Genre.find(params[:genre_id]).name
	    else
	        @products = Product.all
	        @title = "商品"
	    end
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
	end

end
