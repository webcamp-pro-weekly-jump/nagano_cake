class Address < ApplicationRecord

	belongs_to :member

    #バリデーション設定
    validates :name, presence: true
    validates :address, presence: true
    #format~の記述:郵便番号は７桁でハイフンなしでないと保存されない
	validates :pastal_code, presence: true, format: {with: /\A\d{7}\z/}

	# 注文情報入力画面 登録済み情報の表示を「郵便番号 送り先住所 宛名」として表示する
	def select_address
		self.pastal_code + " " + self.address + " " + self.name
	end
end
