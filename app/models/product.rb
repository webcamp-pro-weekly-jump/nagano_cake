class Product < ApplicationRecord
	belongs_to :genres, optional: true
	belongs_to :home, 
	attachment :image
	validates :name, presence: true
	validates :introduction, presence: true
	validates :price, presence: true, numericality: {only_integer: true}

	has_many :cart_items, dependent: :destroy

end
