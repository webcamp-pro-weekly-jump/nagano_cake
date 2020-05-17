class ProductsController < ApplicationController
    before_action :authenticate_member!

	def index
		@genres = Genre.all
		if params[:genre_id]
			@genre = genre.find(params[:genre_id])
			@products = product.where(genre_id: @genre.id)
	    else
	        @products = Product.all
	    end
	end

　　#商品詳細→カートに入れる
	def show
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
	end

end
