class Address < ApplicationRecord
# 追加しました
	belongs_to :member

	# orders/newで登録済住所を表示するメソッド
    def select_address
		self.post_code.to_s + " " + self.address + " " + self.addressee
	end
# ********
end
