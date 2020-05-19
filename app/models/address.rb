class Address < ApplicationRecord

	belongs_to :member

    #バリデーション設定
    validates :name, presence: true
    validates :address, presence: true
    #format~の記述:郵便番号は７桁でハイフンなしでないと保存されない
	validates :pastal_code, presence: true, format: {with: /\A\d{7}\z/}

end
