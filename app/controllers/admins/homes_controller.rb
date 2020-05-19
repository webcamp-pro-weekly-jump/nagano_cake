class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
	 @orders = Order.all
	 @order = Order.where(params[:id])
	end


end
