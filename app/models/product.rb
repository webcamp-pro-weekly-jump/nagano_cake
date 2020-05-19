class Product < ApplicationRecord
	belongs_to :genres, optional: true
	belongs_to :home, 
	attachment :image

	has_many :cart_items, dependent: :destroy
	has_many :customers, through: :cart_items
	has_many :order_items
	has_many :products, through: :order_items

	validates :name, presence: true
	validates :introduction, presence: true
	validates :price, presence: true, numericality: {only_integer: true}
end
