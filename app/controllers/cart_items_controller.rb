class CartItemsController < ApplicationController
	before_action :authenticate_member!

	def index
		@cart_items = CartItem.where(member_id: current_member.id)
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to cart_items_path #カートページにリダイレクト
	end

	def create
		cart_item = CartItem.new(cart_items_params)
		cart_item.member_id = current_member.id
		cart_item.save
		redirect_to cart_items_path #カートページにリダイレクト
	end

	def update
		cart_item = CartItem.find(params[:id])
		cart_item.update(cart_items_params)
		redirect_to cart_items_path #カートページにリダイレクト
	end

    #カートの中身を空にする
	def destroy_all
		cart_items = CartItem.where(member_id: current_member.id)
		cart_items.destroy_all
		redirect_to cart_items_path #カートページにリダイレクト
	end

	private
	def cart_items_params
		params.require(:cart_item).permit(:member_id, :product_id, :quantity)
	end
end
