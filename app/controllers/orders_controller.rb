class OrdersController < ApplicationController
	# ログイン済み会員のみにアクセス許可
	before_action :authenticate_member!
	before_action :set_member
	before_action :order_new, only:[:new, :show, :order_show]

	def new
	end

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
	end

	def order_show
	end

	def success
	end

	private
	def set_member
		@menber = current_member
	end

	def order_new
		@order = Order.new
	end

	def order_params
		params.require(:order).permit(:name, :address, :postal_code,
									  :pay_method, :postage, :all_price,
									  :order_status, :create_at,
			  order_item_attributes: [:order_id,:product_id, :quantity,
			  						  :tax_price,:making_status]
			  						  )
	end
end
