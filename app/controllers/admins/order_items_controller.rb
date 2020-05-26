class Admins::OrderItemsController < ApplicationController
	before_action :authenticate_admin!
	def update
		# @order = Order.find(params[:id])
		@order_item = OrderItem.find(params[:id])
		if@order_item.update(order_item_params)
		  if @order_item.making_status == "製作中"
			 @order_item.order.update(order_status: "製作中")
		  end
		  if @order_item.making_status == "製作完了"
			 @order_item.order.update(order_status: "発送準備中")
			 redirect_back(fallback_location: root_path)
		  end
		else
 		    redirect_to admins_order_path(@order_item.order_id), notice: "製作ステータスを更新しました！"
 		end
		#@order_item.order_idで注文商品の含まれている注文にリダイレクトする。
	end

	private
	def order_item_params
		params.require(:order_item).permit(:making_status,:order_id,:product_id)
	end
end
