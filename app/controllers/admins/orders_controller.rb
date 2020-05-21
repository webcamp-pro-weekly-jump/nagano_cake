class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all.page(params[:page]).per(10)
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		redirect_to admins_member_path(@order.id)
	end

	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
