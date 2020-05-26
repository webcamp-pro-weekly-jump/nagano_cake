class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top
	 @orders = Order.where("created_at LIKE ?", "#{Time.zone.today}%")
	 @order = Order.where(params[:id])
	end


end
