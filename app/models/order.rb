class Order < ApplicationRecord
	belongs_to :member
	# 注文を削除すると注文に関連つけられたorder_itemもすべて削除される。
	has_many :order_items, dependent: :destroy

	has_many :products, through: :order_items
	#子レコードをまとめて登録できるようにする
	accepts_nested_attributes_for :order_items

	# 送り先住所/郵便番号の空データの禁止
	validates :address, presence: true
	validates :postal_code, presence: true

	enum order_status:{
		"入金待ち": 0,
		"入金確認": 1,
		"製作中": 2,
		"発送準備中": 3,
		"発送済": 4
	}
end
