class Admins::HomesController < ApplicationController

	def top
	 @orders = Order.all
	 @order = Order.where(params[:id])

		
	end


end
