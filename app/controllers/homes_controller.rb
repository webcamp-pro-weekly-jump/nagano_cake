class HomesController < ApplicationController
	def about
		
	end

	def top
	@genres = Genre.all
	@products = Product.page(params[:page]).per(4)
	end


end
