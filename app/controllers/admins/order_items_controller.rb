class Admins::OrderItemsController < ApplicationController
	before_action :authenticate_admin!
	def update
		# @order = Order.find(params[:id])
		@order_item = OrderItem.find(params[:id])
		@order_item.update(order_item_params)
		redirect_to admins_order_path(@order_item.order_id), notice: "製作ステータスを更新しました！"
		#@order_item.order_idで注文商品の含まれている注文にリダイレクトする。
	end

	private
	def order_item_params
		params.require(:order_item).permit(:making_status,:order_id,:product_id)
	end
end
