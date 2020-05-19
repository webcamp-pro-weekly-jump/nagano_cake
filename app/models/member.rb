class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 #リレーション
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :addresses # 追加しました
  belongs_to :admins, optional: true

  #バリデーション設定
  validates :email, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  #全角カタカナ以外で記入した場合エラーが表示
  validates :family_name_kana, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  #format~の記述:郵便番号は７桁でハイフンなしでないと保存されない
  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/}
  #format~の記述：14桁以内の数字でハイフンなしでないと保存されない
  validates :tel, presence: true, format: {with: /\A[0-9]{,14}\z/}


  #退会済みユーザーが閲覧できないようにする
  def active_for_authentication?
    super && (self.is_valid == true)
  end
end