class CartItemsController < ApplicationController
	before_action :authenticate_member!

	def index
		@cart_items = cart_items.where(member_id :current_member.id)
	end

	def edit
		
	end

	def destroy
		
	end

	def create
		
	end

	def update
		
	end

	def new
		
	end

	def destroy_all
		
	end

	def add_items
		
	end

	private
	def cart_items_params
		params.require(:cart_items).permit(:member_id, :product_id, :quantity)
	end
end
