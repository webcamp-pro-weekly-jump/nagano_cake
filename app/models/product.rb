class Product < ApplicationRecord
	belongs_to :genres, optional: true
	attachment :image
end
