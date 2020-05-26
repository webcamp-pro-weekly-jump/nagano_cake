class CartItemsController < ApplicationController
	before_action :authenticate_member!

	def index
		@cart_items = CartItem.where(member_id: current_member.id)
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to cart_items_path, notice: "商品を削除しました！" #カートページにリダイレクト
	end

	def create
		@cart_item = CartItem.new(cart_items_params)
		@cart_item.member_id = current_member.id
		#同一商品を追加しようとした場合エラーが表示
		product = CartItem.find_by(product_id: params[:cart_item][:product_id].to_i)
		if product.present?
		   redirect_to cart_items_path, alert: "その商品は登録済みです。数量を変更してください。"
		else
			@cart_item.save
		    redirect_to cart_items_path, notice: "商品を追加しました！" #カートページにリダイレクト
	    end
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_items_params)
		redirect_to cart_items_path, notice: "数量を変更しました！" #カートページにリダイレクト
	end

    #カートの中身を空にする
	def destroy_all
		@cart_items = CartItem.where(member_id: current_member.id)
		@cart_items.destroy_all
		redirect_to cart_items_path, notice: "カートを空にしました！" #カートページにリダイレクト
	end

	private
	def cart_items_params
		params.require(:cart_item).permit(:member_id, :product_id, :quantity)
	end
end
