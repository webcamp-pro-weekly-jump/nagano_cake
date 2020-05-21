class Admins::OrderItemsController < ApplicationController
	before_action :authenticate_admin!
	def update
		@order = Order.find(params[:id])
		@order_item = OrderItem.find(params[:id])
		@order_item.save(order_item_params)
		redirect_to admins_order_path(@order), notice: "製作ステータスを更新しました！"
	end

	private
	def order_item_params
		params.require(:order_item).permit(:making_status,:order_id,:product_id)
	end
end
