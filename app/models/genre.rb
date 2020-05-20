class Genre < ApplicationRecord
	has_many :products
	belongs_to :home, optional: true
	validates :name, presence: true
end
 