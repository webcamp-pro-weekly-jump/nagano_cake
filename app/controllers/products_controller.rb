class ProductsController < ApplicationController
    before_action :authenticate_member!

    #ジャンル機能できたらif~elseで反映させます
	def index
		@products = Product.all
	end

	def show
		@products = Product.find(params[:id])
		@cart_item = CartItem.new
	end

end
