class Product < ApplicationRecord
	belongs_to :genres, optional: true
	attachment :image

	has_many :cart_items, dependent: :destroy

end
