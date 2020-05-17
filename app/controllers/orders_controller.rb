class OrdersController < ApplicationController

	def new
	end

	def index
	end

	def show
	end

	def create
	end

	def edit
	end

	def update
	end

	def order_show
	end

	def success
	end

	private
	def order_params
		params.require(:order).permit()
	end
end
