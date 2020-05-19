class OrdersController < ApplicationController
	# ログイン済み会員のみにアクセス許可
	before_action :authenticate_member!
	before_action :set_member
	before_action :order_new, only:[:new, :show, :order_show]

	def new
	end

	def index
		@orders = @member.orders
	end

	def show
		@order = Order.find(params[:id])
	end

	def create
		if current_member.cart_items.exists?
			@order = Order.new(order_params)
			@order.member_id = current_member.id

			# 住所のラジオボタン選択の引数に応じて分岐
			@flag = params[:order][:flag]
			if @flag.to_i == 0 then
				@order.postal_code = @member.postal_code
				@order.address = @member.address
				@order.name = @member.family_name + @member.first_name
			elsif @flag.to_i == 1 then
				@order.postal_code = params[:order][:postal_code]
				@order.address = params[:order][:address]
				@order.name = params[:order][:name]
			elsif @flag.to_i == 2 then
				@order.postal_code = params[:order][:postal_code]
				@order.address = params[:order][:address]
				@order.name = params[:order][:name]
			end

			@order.save

			# 新しいお届け先の入力内容に一致するものがなければ、登録する
			 if Address.find_by(address: @order.address).nil?
				@address = Address.new
				@address.pastal_code = @order.postal_code
				@address.address = @order.address
				@address.member_id = current_member.id
				@address.save
			end

			# cart_itemsの内容をorder_itemsに新規登録
			current_member.cart_items.each do |cart_item|
		  		order_item = @order.order_items.build
		  		order_item.order_id = @order.id
		  		order_item.product_id = cart_item.product_id
		  		order_item.quantity = cart_item.quantity
		  		order_item.tax_price = cart_item.product.price * 1.08
				# order_itemにデータを保存
		  		order_item.save
		  		# cart_itemのデータを削除
		  		cart_item.destroy
			end
			render action: :success # 注文完了ページに遷移させたい
		else
			redirect_to products_path
		end
	end

	def order_show
		@order = Order.new
		@cart_items = current_member.cart_items
		@order.pay_method = params[:order][:pay_method]
		# 住所のラジオボタン選択に応じて引数を調整
		@flag = params[:order][:flag]
		if @flag.to_i == 0 then
			@order.postal_code = @member.postal_code
			@order.address = @member.address
			@order.name = @member.family_name + @member.first_name
		elsif @flag.to_i == 1 then
			@set_address = params[:order][:address].to_i
			@send_to_address = Address.find(@set_address)
			@order.postal_code = @send_to_address.postal_code
			@order.address = @send_to_address.address
			@order.name = @send_to_address.name
		elsif @flag.to_i == 2 then
			@order.postal_code = params[:order][:add_address][:post_code]
			@order.address = params[:order][:add_address][:address]
			@order.name = params[:order][:add_address][:name]
		end
	end

	def success
	end

	private
	def set_member
		@member = current_member
	end

	def order_new
		@order = Order.new
	end

	def order_params
		params.require(:order).permit(:name, :address, :postal_code,
									  :pay_method, :postage, :all_price,
									  :order_status, :created_at,
			  order_item_attributes: [:order_id,:product_id, :quantity,
			  						  :tax_price,:making_status]
			  						  )
	end
end
