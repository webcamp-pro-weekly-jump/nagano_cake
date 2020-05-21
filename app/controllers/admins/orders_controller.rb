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

	private
	def order_params
		params.require(:order).permit(:name, :address, :postal_code,
									  :pay_method, :postage, :all_price,
									  :order_status, :created_at,
			  order_item_attributes: [:order_id,:product_id, :quantity,
			  						  :tax_price,:making_status]
			  						  )
	end
end
