class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def update
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
