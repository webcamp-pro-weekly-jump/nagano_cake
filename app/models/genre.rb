class Genre < ApplicationRecord
	has_many :products
	belongs_to :home
	validates :name, presence: true
end
 